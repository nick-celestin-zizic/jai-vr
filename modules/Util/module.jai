#import "Basic";
#import "Program_Print";
#import "Compiler";
#import "Process";
#import "File";

reinterpret_cast :: ($target: Type, value: $T) -> target #expand {
    return <<(cast(*target)*value);
}

disable_logging :: () #expand  {
    old_logger := context.logger;
    context.logger = (a, b, c) => {};
    `defer context.logger = old_logger;
}

scope_reset_temp :: () #expand {
    mark := get_temporary_storage_mark();
    `defer set_temporary_storage_mark(mark);
}

dumpt :: #bake_arguments dump(show_type = true);
dump :: (code: Code, $show_type := false) #expand {
#insert,scope(code) #run () -> string {
    root := compiler_get_nodes(code);
    
    b: String_Builder;
    b.allocator = temp;
    print_expression(*b, root);
    expr := builder_to_string(*b);
    
    return tprint(#ifx show_type then "log(\"%1 : %% = %%\", type_of(%1), %1);"; else "log(\"%1 = %%\", %1);";, expr);
}();
}

todo :: (using loc := #caller_location) #expand {
    log_error("%:%:%: NOT YET IMPLEMENTED", fully_pathed_filename, line_number, character_number);
    exit(1);
}

cmd :: (args: .. string, redirect_stdout_to_file := "", log_cmd := false, loc := #caller_location) {
    if log_cmd then log("[CMD] %\n", get_quoted_command_string(args));

    result, output_string, error_string := run_command(..args, capture_and_return_output = redirect_stdout_to_file != "");
    if result.exit_code {
        if output_string then log("%", output_string);
        if error_string then log("%", error_string);
        compiler_report(tprint("Command failed with exit code '%'.\n", result.exit_code), loc);
        exit(result.exit_code);
    }

    if redirect_stdout_to_file then write_entire_file(redirect_stdout_to_file, output_string);
}

// NOTE: this just makes it so that the macro is called on the result
#import "Windows";
check_hresult :: inline (hr: HRESULT) -> HRESULT { return hr; }

#if 0 {
// NOTE: this is useless, I just find it neat :)
print_all_windows_messages :: () {
    for 0..U32_MAX {
        err: string = ---;
        err.count = FormatMessageA(
            FORMAT_MESSAGE_ALLOCATE_BUFFER | FORMAT_MESSAGE_FROM_SYSTEM, null,
            it, MAKELANGID(LANG_NEUTRAL, SUBLANG_DEFAULT), xx *err.data, 0, null
        );
        
        if err.count {
            print("------------------------------------------\n");
            log("%: %", it, err);
        }
        
        LocalFree(err.data);
    }
}
}
