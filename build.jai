#import "Basic";
#import "String";
#import "Compiler";
#import "Process";
#import "Program_Print";
#import "File";
#import "File_Watcher";
#import "Command_Line";

#import "Metaprogram_Plugins";

#import,dir "modules/Util";

EXE_NAME :: "Vr";
EXE_DIR  :: #run tprint("%bin", #filepath);
EXE      :: #run tprint("%/%.exe", EXE_DIR, EXE_NAME);

plugins: [..]*Metaprogram_Plugin;
plugin_names :: string.["Check"];//, "Iprof"];

compilation_mode: enum {
    BUILD :: 0;
    RUN   :: 1;
    CHECK :: 2;
};

#run {
    // TODO: set import path using dc build options once its supported
    defer set_build_options_dc(.{do_output=false});
    
    w := compiler_create_workspace("Main Program");
    if !w {
        print("Workspace creation failed!\n");
        return;
    }

    mode_set := false;
    for get_build_options(w).compile_time_command_line if starts_with(it, "mode=") {
        found, _, mode := split_from_right(it, #char "=");
        assert(found);
        
        info := cast(*Type_Info_Enum) type_of(compilation_mode);
        
        mark := get_temporary_storage_mark();
        for info.names if to_upper_copy(mode) == it {
            compilation_mode = xx info.values[it_index];
            mode_set = true;
            break;
        }
        set_temporary_storage_mark(mark);
        
        if mode_set break;
    }

    if !mode_set {
        print("you have to set mode=[BUILD | RUN | CHECK]\n");
        exit(1);
    }
    
    set_my_build_options(w);
    
    if compilation_mode == {
        case .BUILD; compile_main(w);
        case .RUN;   compile_main(w); cmd(EXE);
        case .CHECK; do_checking_loop();
    }
}

set_my_build_options :: (w: Workspace) {
    using options := get_build_options(w);
    defer set_build_options(options, w);
    
    output_executable_name = EXE_NAME;
    output_path            = EXE_DIR;
    dead_code_elimination  = .ALL;
    
    my_imports: [..]string;
    for import_path array_add(*my_imports, it);
    array_add(*my_imports, tprint("%0modules", #filepath));
    import_path = my_imports;

    if compilation_mode == {
        case .BUILD; {
            backend = .LLVM;
        }
        case .CHECK; {
            dead_code_elimination = .MODULES_ONLY;
        } #through;
        case .RUN; {
            backend                       = .X64;
            text_output_flags             = 0;
            interactive_bytecode_debugger = true;
        }
    }
}

do_checking_loop :: () {
    compile :: (path: string) {
        print("\x1B[0;0H\x1B[2J");                         // clear the screen
        defer print("\x1B[F\x1B[K\rRecompiled %\n", path); // replace the linker line
        
        w := compiler_create_workspace("Checking");
        defer compiler_destroy_workspace(w);
        
        set_my_build_options(w);
        compile_main(w);
    }

    watcher: File_Watcher;
    watcher.watch_recursively = true;
    assert(init(*watcher, (_, c) => {
        if (c.events & .MODIFIED) && ends_with(c.full_path, ".jai")
        then inline compile(c.full_path);
    }, .MODIFIED));
    defer deinit(watcher);
    
    assert(add_directories(*watcher, tprint("%0%", #filepath, "src")));
    assert(add_directories(*watcher, tprint("%0%", #filepath, "modules")));

    compile(#filepath);
    while true {
        _, needs_wait, wait_seconds := process_changes(*watcher);
        if needs_wait then sleep_milliseconds(xx (wait_seconds * 1000));
        else sleep_milliseconds(20);
    }
}

compile_main :: (w: Workspace) {
    init_plugins(plugin_names, *plugins, w);
    
    for plugins if it.before_intercept then it.before_intercept(it);
    compiler_begin_intercept(w);

    for plugins if it.add_source then it.add_source(it);
    add_build_file(tprint("%/src/main.jai", #filepath), w);

    message_loop();
    
    compiler_end_intercept(w);

    for plugins if it.finish   then it.finish(it);
    for plugins if it.shutdown then it.shutdown(it);
}

#import "Code_Visit";
message_loop :: () {
    generated_code := false;
    while true {
        using msg := compiler_wait_for_message();
        
        for plugins if it.message then it.message(it, msg);
        
        if kind == {
            case .TYPECHECKED; {
                typechecked := cast(*Message_Typechecked) msg;
                for body: typechecked.procedure_bodies {
                    for body.subexpressions gl_collect_proc_call(it);
                    
                    expr := body.expression;
                    if !(expr.body_flags & .ALREADY_MODIFIED) then for stmt: expr.block.statements {
                        new_expr := inject_monadic_error_handling(stmt, body.expression);
                        if new_expr {
                            body.expression.block.statements[it_index] = new_expr;
                            compiler_modify_procedure(workspace, body.expression);
                        }
                    }
                }
            }
            case .PHASE; {
                msg_phase := cast(*Message_Phase) msg;
                
                if msg_phase.phase == .TYPECHECKED_ALL_WE_CAN && !generated_code {
                    generated_code = true;
                    
                    gl_generate_proc_loader(workspace);
                }
                
            }
            case .FAILED_IMPORT; {
                using msg_fail := cast(*Message_Failed_Import) msg;
                
                compiler_report(tprint(
                    "% could not import %",
                    ifx host_module_name then host_module_name else "Main Program",
                    target_module_name
                ));
                
            }
            
            case .FILE;
            case .IMPORT;
            case .COMPLETE; break;
            case .ERROR; if compilation_mode == .CHECK then continue; else exit(1);
            case; compiler_report(tprint("Unhandled message type `%`!\n", kind));
        }
    }    
}

#import,dir "modules/XR";
match_unused_xr_result :: (expr: *Code_Node) -> (matched: bool, name: string, template: string) {
    if expr.kind != .PROCEDURE_CALL return false, "", "";
    pc := cast(*Code_Procedure_Call) expr;
    
    if !pc.resolved_procedure_expression || pc.num_return_values_received != 0 return false, "", "";
    if pc.resolved_procedure_expression.kind != .PROCEDURE_HEADER return false, "", "";
    header := cast(*Code_Procedure_Header) pc.resolved_procedure_expression;
    
    if !header || !header.returns || header.returns.count > 1 return false, "", "";
    decl := <<header.returns[0];

    if !decl.type_inst.type_valued_expression return false, "", "";
    type_expr := decl.type_inst.type_valued_expression;

    if type_expr.kind != .IDENT return false, "", "";
    ident := cast(*Code_Ident) type_expr;

    if ident.name != "XrResult" return false, "", "";

    return true, header.name, #string DONE
    {
        result := %;
        if cast(s32) result < 0 {
            result_c_str : [XR_MAX_RESULT_STRING_SIZE] u8;
            xrResultToString(xr_instance, result, *result_c_str);
            log_error("%:%:%: % failed with code %%1:\n  %%2", result, to_string(result_c_str.data));
        }
    }
    DONE;
}

#import "Windows";
match_unused_hresult :: (expr: *Code_Node) -> (matched: bool, name: string, template: string) {
    if expr.kind != .PROCEDURE_CALL return false, "", "";
    pc := cast(*Code_Procedure_Call) expr;
    
    if !pc.resolved_procedure_expression || pc.num_return_values_received != 0 return false, "", "";
    if pc.resolved_procedure_expression.kind != .PROCEDURE_HEADER return false, "", "";
    header := cast(*Code_Procedure_Header) pc.resolved_procedure_expression;
    
    if !header || !header.returns || header.returns.count > 1 return false, "", "";
    decl := <<header.returns[0];

    if !decl.type_inst.type_valued_expression return false, "", "";
    type_expr := decl.type_inst.type_valued_expression;

    if type_expr.kind != .IDENT return false, "", "";
    ident := cast(*Code_Ident) type_expr;

    if ident.name != "HRESULT" return false, "", "";

    return true, header.name, #string DONE
    {
        hr := %;
        if FAILED(hr) {
            code := <<cast(*u32)*hr; // EEK
            err: string = ---;
            err.count = FormatMessageA(
                FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM, null,
                code, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), xx *err.data, 0, null
            );
            
            log_error("%:%:%: % failed with code %%1:\n  %%2", code, err);
            
            LocalFree(err.data);
            #insert on_fail;
        }
    }
    DONE;
}

match_error_pattern :: (expr: *Code_Node) -> (matched: bool, name: string, template: string) {
    matched, name, template := match_unused_hresult(expr);
    if matched return matched, name, template;
    
    // TODO: add OpenXR checks
    matched, name, template = match_unused_xr_result(expr);
    if matched return matched, name, template;

    return false, "", "";
}

inject_monadic_error_handling :: (expr: *Code_Node, scope: *Code_Node) -> *Code_Node {
    matched, name, template := match_error_pattern(expr);
    if !matched return null;

    sb: String_Builder;
    sb.allocator = temp;
    print_expression(*sb, expr);

    literal := New(Code_Literal); // @Leak
    literal.kind           = .LITERAL;
    literal.value_type     = .STRING;
    literal.values._string = tprint(
        template, builder_to_string(*sb),
        expr.location.enclosing_load.fully_pathed_filename, expr.location.l0, expr.location.c0,
        name);
    
    insert := New(Code_Directive_Insert);  // @Speed @Heap!
    insert.kind              = .DIRECTIVE_INSERT;
    insert.expression        = literal;
    insert.location          = expr.location;
    //insert.scope_redirection = expr;
    
    return insert;
}


#import "GL";
gl_longest_proc_name := 0; // for aligning spaces :)
gl_proc_names: [..]string;
gl_collect_proc_call :: (expr: *Code_Node) {
    // filter out everything we don't care about
    if expr.kind != .PROCEDURE_CALL return;
    procedure_call := cast(*Code_Procedure_Call) expr;
    if procedure_call.procedure_expression.kind != .IDENT return;
    using ident := cast(*Code_Ident) procedure_call.procedure_expression;
    if !resolved_declaration || resolved_declaration.expression || !get_field(type_info(GL_Procedures), name) return;

    // add it to the code gen
    if array_add_if_unique(*gl_proc_names, name) && (name.count > gl_longest_proc_name)
        gl_longest_proc_name = name.count;
}


gl_generate_proc_loader :: (w: Workspace) {
    b: String_Builder;
    defer add_build_string(builder_to_string(*b), w);
    write :: (fmt: string, args: ..Any) #expand { print_to_builder(*`b, fmt, ..args); } @PrintLike;
    
    write("generated_gl_load_used_procs :: () {\n");
    for gl_proc_names {
        write("    gl.% ", it);
        for 1..(gl_longest_proc_name - it.count) write(" ");
        write("= xx wglGetProcAddress(xx \"%\\0\".data);\n", it);
    }
    write("}\n");
}
