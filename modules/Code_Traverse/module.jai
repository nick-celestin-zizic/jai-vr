#run {
    expr, copy := compiler_get_nodes(test_case);

    //for * copy dumpt(<<it);

    //for expr dump(<<it);
}

Code_Ptr :: *Code_Node;

#scope_file
for_expansion :: (root_node: Code_Ptr, loop_body: Code, $flags: For_Flags) #expand {
    stack: [..]*Code_Node;
    array_reserve(*stack, 100);
    defer array_free(stack);

    Item_Type :: type_of(<<stack.data);
    PUSH :: (item: Item_Type)        #expand { if item array_add(*`stack, item); }
    PUSH :: (to_append: ..Item_Type) #expand { if to_append.count array_add(*`stack, ..to_append);  }

    i := 0;

    array_add(*stack, root_node);

    while stack.count > 0 {
        node := stack[stack.count - 1];
        array_ordered_remove_by_index(*stack, stack.count - 1);

        `it := node;
        `it_index := i;
        i += 1;
        #insert loop_body;

        dump(<<node);
        if node.kind == {
            case .PROCEDURE_CALL; {
                using proc_call := cast(*Code_Procedure_Call) node;
                PUSH(procedure_expression);
                PUSH(..arguments_sorted);
                PUSH(macro_expansion_block);
            }
            case .RETURN; {
                using returnn := cast(*Code_Return) node;
                PUSH(..arguments_sorted);
            }
            case .WHILE; {
                using whilee := cast(*Code_While) node;
                PUSH(condition);
                PUSH(block);
            }
            case .FOR; {
                using forr := cast(*Code_For) node;
                PUSH(iteration_expression);
                PUSH(iteration_expression_right);
                PUSH(block);
                PUSH(want_pointer_expression);
                PUSH(want_reverse_expression);
            }
            case .COMPOUND_DECLARATION; {
                using compound_decl := cast(*Code_Compound_Declaration) node;
                PUSH(comma_separated_assignment);
                PUSH(alignment_expression);
            }
            case; Code_Declaration; {
                using decl := cast(*Code_Declaration) node;
                if type_inst != xx 1    PUSH(type_inst);  // ???????
                if expression > xx 0x19 PUSH(expression); // ???????
                if alignment_expression != xx 2   PUSH(alignment_expression); // ???????
            }
            case .BLOCK; {
                block := cast(*Code_Block) node;
                for block.statements PUSH(block.statements[it_index]); // ??????
            }
            case .TYPE_INSTANTIATION; {
            }
            case .IF; {
                using iff := cast(*Code_If) node;
                PUSH(condition);
                PUSH(then_block);
                PUSH(else_block);
            }
        }
    }
}

test_case :: #code {
    log("1st");

    foozle := true;
    if foozle {
        log("2nd");

        if false {log("oh...");} else {
            log("3rd");
        }
    }

    while true log("4th");

    for 0..10 {
        log("nth");
    }

    log("last");
};

#scope_file
#import "Basic";
#import "Util";
#import "Compiler";
