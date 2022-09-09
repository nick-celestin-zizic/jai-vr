#import "Basic";
#import "String";
#import "Compiler";
#import "BuildCpp";
#import "Bindings_Generator";

#load "../../src/Util.jai";

#run {
    defer set_build_options_dc(.{do_output=false});
    
    print("Building static library:\n");
		if !build_cpp_static_lib( "cgltf", "cgltf.cpp") {
        print("Could not build cgltf.lib");
        exit(1);
    }
    
    print("Generating module.jai\n");
    using options: Generate_Bindings_Options;
    
    array_add(*extra_clang_arguments, "-x", "c++");
    array_add(*system_include_paths, GENERATOR_DEFAULT_SYSTEM_INCLUDE_PATH);
    
    array_add(*source_files,   "cgltf.h");
    array_add(*source_files,   "cgltf_write.h");
    array_add(*libpaths,       ".");
    array_add(*include_paths,  ".");
    array_add(*libnames,       "cgltf");
    
    visitor = (using decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
        PREFIX :: "cgltf_";

        if kind == .ENUM {
            using decl_enum := cast(*Enum) decl;
            for * enumerates {
                it.output_name = to_upper_copy(it.output_name);
            }
        }
        if kind == .ENUM || kind == .STRUCT {
            output_name = advance(output_name, PREFIX.count);
            for 0..output_name.count-1 {
                if it == 0 || output_name[it-1] == #char "_"
                then output_name[it] = to_upper(output_name[it]);
            }

            if kind == .ENUM then return .RECURSE;
        } else if kind == .FUNCTION {
            output_name = advance(output_name, PREFIX.count);
        } else if !(decl_flags & .OMIT_FROM_OUTPUT){
            assert(type != null); using type;
            if   type_of_typedef && type_of_typedef.name == "size_t"
            then type_of_typedef.output_name = "u64";
        }

        return .STOP;
    };
    
    if !generate_bindings(options, "module.jai") {
        print("could not create module.jai");
        exit(1);
    }
};
