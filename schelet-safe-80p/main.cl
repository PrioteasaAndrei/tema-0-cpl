class Main inherits IO{
    lists : List;
    looping : Bool <- true;
    somestr : String <- "load";
    input_text : String <- "DEFAULT";
    
    -- TODO : print cu un index
    -- TODO : problema cand se face merge cand sunt doar doua in lista
    main():Object {
        let converter : A2I <- new A2I,
            attr1 : String,
            attr2 : String,
            attr3 : String,
            attr4 : String,
            int_attr4 : Int,
            -- local_list : List,
            tk : Tokenize <- new Tokenize in
        while looping loop {

            if somestr = "help" then
                {
                    out_string("Available commands: load, print, merge i j, filterBy index {ProductFilter,RankFilter,SamePriceFilter},sortBy index {PriceComparator,RankComparator,AlphabeticComparator} {ascendent,descendent}\n");
                }
            else if somestr = "load" then
                {
                    let local_list : List in
                        {
                            -- trebuie intr-un while pana la end
                            -- out_string("Loading the lists.\n");
                            input_text <- in_string();
                            -- out_string(input_text);
                            
                            
                            while not (input_text = "END") loop
                                {                   

                                    -- out_string("Input line is: ");
                                    -- out_string(input_text);
                                    -- out_string("\n\n------\n\n");
                                    -- pot sa fie 1 token - IO , 2 tokeni rankuri + String si Int , 4 tokeni obiecte de la ei
                                    tk.init(input_text," ");
                                    attr1 <- tk.nextToken();
                                    attr2 <- tk.nextToken();
                                    
                                    if not (input_text = "END") then 
                                    {

                                        if attr2 = "" then
                                            {
                                                -- IO CLASS
                                                if attr1 = "IO" then
                                                    {
                                                        -- IO
                                                        -- out_string(attr1);
                                                        if local_list.isEmpty() then local_list <- new List.append(new List.add(new IO)) else local_list <- local_list.append(new List.add(new IO)) fi; 
                                                    }
                                                else
                                                    {
                                                        out_string("Incorrect class type\n");
                                                        abort();
                                                    }
                                                fi;

                                            }
                                        else
                                            {
                                                attr3 <- tk.nextToken();

                                                if attr3 = "" then
                                                    {
                                                        -- String or Int
                                                        if attr1 = "String" then
                                                            {
                                                                -- STRING
                                                                -- attr1 string attr2 val
                                                                -- out_string("---");
                                                                -- out_string(attr1);
                                                                -- out_string(" ");
                                                                -- out_string(attr2);
                                                                -- out_string("\n");
                                                                -- ISVOID SAU ISEMPTY?
                                                                if (isvoid local_list) then local_list <- new List.append(new List.add(attr2)) else local_list <- local_list.append(new List.add(attr2)) fi; 
                                                            }
                                                        else if attr1 = "Int" then let attr2_casted_int : Int in 
                                                            {
                                                                -- INT
                                                                -- attr1 Int attr2 val
                                                                -- out_string("---");
                                                                -- out_string(attr1);
                                                                -- out_string(" ");
                                                                -- out_string(attr2);
                                                                -- out_string("\n");
                                                                attr2_casted_int <- converter.a2i(attr2);
                                                                if (isvoid local_list) then local_list <- new List.append(new List.add(attr2_casted_int)) else local_list <- local_list.append(new List.add(attr2_casted_int)) fi; 
                                                            }
                                                        else if attr1 = "Bool" then let bool_casted : Bool in
                                                            {
                                                                -- Bool
                                                                -- attr2 is true/false
                                                                -- out_string("---");
                                                                -- out_string(attr1);
                                                                -- out_string(" ");
                                                                -- out_string(attr2);
                                                                -- out_string("\n");
                                                                bool_casted = if attr2 = "true" then true else false fi;
                                                                if (isvoid local_list) then local_list <- new List.append(new List.add(bool_casted)) else local_list <- local_list.append(new List.add(bool_casted)) fi; 
                                                            }
                                                        else if attr1 = "Private" then
                                                            {
                                                                -- Private
                                                                -- out_string("---");
                                                                -- out_string(attr1);
                                                                -- out_string(" ");
                                                                -- out_string(attr2);
                                                                -- out_string("\n");

                                                                if (isvoid local_list) then local_list <- new List.append(new List.add(new Private.init(attr2))) else local_list <- local_list.append(new List.add(new Private.init(attr2))) fi; 
                                                            }
                                                        else if attr1 = "Corporal" then
                                                            {
                                                                -- Corporal
                                                                -- out_string("---");
                                                                -- out_string(attr1);
                                                                -- out_string(" ");
                                                                -- out_string(attr2);
                                                                -- out_string("\n");
                                                                if (isvoid local_list) then local_list <- new List.append(new List.add(new Corporal.init(attr2))) else local_list <- local_list.append(new List.add(new Corporal.init(attr2))) fi;
                                                            }
                                                        else if attr1 = "Sergent" then
                                                            {
                                                                -- Sergent
                                                                -- out_string("---");
                                                                -- out_string(attr1);
                                                                -- out_string(" ");
                                                                -- out_string(attr2);
                                                                -- out_string("\n");
                                                                if (isvoid local_list) then local_list <- new List.append(new List.add(new Sergent.init(attr2))) else local_list <- local_list.append(new List.add(new Sergent.init(attr2))) fi;
                                                            }
                                                        else if attr1 = "Officer" then
                                                            {
                                                                -- Officer
                                                                -- out_string("---");
                                                                -- out_string(attr1);
                                                                -- out_string(" ");
                                                                -- out_string(attr2);
                                                                -- out_string("\n");
                                                                if (isvoid local_list) then local_list <- new List.append(new List.add(new Officer.init(attr2))) else local_list <- local_list.append(new List.add(new Officer.init(attr2))) fi;
                                                            }
                                                        else
                                                            {
                                                                out_string("Incorrect class type\n");
                                                                abort();

                                                            }
                                                        fi fi fi fi fi fi fi;
                                                    }
                                                else
                                                    {
                                                        attr4 <- tk.nextToken();
                                                        if attr4 = "" then
                                                            {
                                                                out_string("Incorrect parameter number\n");
                                                                abort();
                                                            }
                                                        else
                                                            {
                                                                -- attr4 e string trebuie sa il fac int
                                                                int_attr4 <- converter.a2i(attr4);

                                                                if attr1 = "Soda" then
                                                                    {
                                                                        -- out_string(attr1);
                                                                        if (isvoid local_list) then local_list <- new List.append(new List.add(new Soda.init(attr2,attr3,int_attr4))) else local_list <- local_list.append(new List.add(new Soda.init(attr2,attr3,int_attr4))) fi;
                                                                        
                                                                    }
                                                                else if attr1 = "Coffee" then
                                                                    {
                                                                        -- out_string(attr1);
                                                                        if (isvoid local_list) then local_list <- new List.append(new List.add(new Coffee.init(attr2,attr3,int_attr4))) else local_list <- local_list.append(new List.add(new Coffee.init(attr2,attr3,int_attr4))) fi;
                                                                    }
                                                                else if attr1 = "Laptop" then
                                                                    {
                                                                        -- out_string(attr1);
                                                                        if (isvoid local_list) then local_list <- new List.append(new List.add(new Laptop.init(attr2,attr3,int_attr4))) else local_list <- local_list.append(new List.add(new Laptop.init(attr2,attr3,int_attr4))) fi;
                                                                    }
                                                                else if attr1 = "Router" then
                                                                    {
                                                                        -- out_string(attr1);
                                                                        if (isvoid local_list) then local_list <- new List.append(new List.add(new Router.init(attr2,attr3,int_attr4))) else local_list <- local_list.append(new List.add(new Router.init(attr2,attr3,int_attr4))) fi;
                                                                    }
                                                                else
                                                                    {
                                                                        out_string("Incorrect last parameter\n");
                                                                        out_string(attr1);
                                                                        out_string(attr2);
                                                                        out_string(attr3);
                                                                        out_string(attr4);
                                                                        abort();
                                                                    }
                                                                fi fi fi fi;
                                                            }
                                                        fi;
                                                    }
                                                fi;
                                            }
                                        fi;
                                    }
                                    else
                                    {
                                        0;
                                    }
                                    fi;

                                    input_text <- in_string();
                                }
                            pool;
                            if (isvoid lists) then lists <- new List.append(new List.add(local_list)) else lists <- lists.append(new List.add(local_list)) fi;    
                        };

                    
                    -- out_string("GOT HERE\n");
                    -- aici trebuie sa fac cumva sa fac append la lista in lista si sa nu mi le uneascas
                   
                }
            else if somestr.substr(0,5) = "print" then
                    if somestr.length() = 5 then
                        {
                            -- afiseaza pe toate
                            -- out_string("Printing all the lists.\n");
                            if not (isvoid lists) then

                                case lists.hd() of 
                                    casted_list : List => if not (isvoid lists) then lists.printListOfListsAll(1,lists) else out_string("No added items\n") fi; 
                                    o : Object => {out_string("lists.hd() is of type object in print\n"); abort(); new List;};
                                esac
                            
                            else
                                out_string("List of lists is empty\n")
                            fi;
                            -- if not (isvoid lists) then lists.debugPrint(lists.hd()) else out_string("No added items\n") fi; 
                            
                        }
                    else let number_str : String,
                            number_int : Int in  
                        {
                            -- afiseaza la un index din nou aici poate sa aiba oricate caractere a2i
                            number_str <- somestr.substr(6,1);
                            number_int <- converter.c2i(number_str);

                            -- daca index mai mare ca len abort
                            lists.printAtIndex(1,number_int,lists);
                        }
                    fi
                 -- sper sa fie numere doar de o cifra
            else if somestr.substr(0,8) = "filterBy" then
                let index_str : String,
                    index_int : Int,
                    my_filter : Filter,
                    filter_type : String in
                    {
                        index_str <- somestr.substr(9,1);
                        index_int <- converter.c2i(index_str);
                        filter_type <- somestr.substr(11,1);
                        -- out_string("Filter with the index: ");
                        -- out_int(index_int);
                        -- out_string("\n");

                        if filter_type = "P" then 
                            {
                                -- out_string("ProductFilter");
                                my_filter <- new ProductFilter;
                            }
                        else if filter_type = "R" then
                            {
                                -- out_string("RankFilter");
                                my_filter <- new RankFilter;
                            }
                        else if filter_type = "S" then
                            {
                                -- out_string("SamePriceFilter");
                                my_filter <- new SamePriceFilter;    
                            }
                            
                        else
                            {
                                out_string("Unknown filter\n");
                                abort();
                            }
                        fi fi fi;

                        -- filter 
                        case lists.filterAtIndex(index_int,lists,my_filter) of 
                            casted_lists : List => lists <- casted_lists;
                            o : Object => abort();
                        esac; 
                        


                    }
            else if somestr.substr(0,6) = "sortBy" then
                let index_str : String,
                    index_int : Int,
                    sort_type : String,
                    type : String,
                    direction : String,
                    sort_direction: String in
                    {
                        index_str <- somestr.substr(7,1);
                        index_int <- converter.c2i(index_str);
                        sort_type <- somestr.substr(9,1);
                        -- a for ascending e for descending
                        sort_direction <- somestr.substr(somestr.length() -9,1);

                        if sort_direction = "a" then 
                            -- out_string("ASCENDING\n")
                            direction <- "ascending" 
                        else if sort_direction = "e" then 
                            direction <- "descending"
                        else
                            {
                                out_string("WRONG DIRECTION\n");
                                abort();
                            }
                        fi fi;

                        if sort_type = "P" then 
                            -- out_string("PriceComparator\n")
                            type <- "PriceComparator"
                        else if sort_type = "R" then 
                            -- out_string("RankComparator\n")
                            type <- "RankComparator"
                        else if sort_type = "A" then
                            -- out_string("AlphabeticComparator\n")
                            type <- "AlphabeticComparator"
                        else
                            {
                                out_string("Unknown comparator\n");
                                abort();
                            }
                        fi fi fi;


                        -- if type = "AlphabeticComparator" then
                        --     if direction = "descending" then
                        --         direction <- "ascending"
                        --     else
                        --         direction <- "descending"
                        --     fi
                        -- else
                        --     out_string("")
                        -- fi;

                        case lists.sortAtIndex(index_int,lists,type,direction) of 
                            casted_lists : List => lists <- casted_lists;
                            o : Object => {out_string("Nu trebuie sa ajung aici\n"); abort(); new Object;};
                        esac; 


                    }
            else if somestr.substr(0,5) = "merge" then 
                if somestr.length() = 9 then
                    let first_number_str : String,
                        second_number_str : String,
                        first_number_int : Int,
                        second_number_int : Int,
                        first_list : Object,
                        second_list : Object,
                        first_list_casted : List,
                        second_list_casted : List,
                        result_list : List in 
                    {
                        -- aici ceva nu e bine ca poate o sa fie doua cifre
                        first_number_str <- somestr.substr(6,1);
                        second_number_str <- somestr.substr(8,1);

                        -- out_string(first_number_str);
                        -- out_string(" ");
                        -- out_string(second_number_str);
                        -- out_string("\n");

                        first_number_int <- converter.c2i(first_number_str);
                        second_number_int <- converter.c2i(second_number_str);

                        
                        -- out_int(first_number_int);
                        -- out_string(" ");
                        -- out_int(second_number_int);

                        first_list <- lists.get(first_number_int);
                        second_list <- lists.get(second_number_int);

                        case first_list of 
                            casted_first : List => first_list_casted <- casted_first;
                            o : Object => new List;
                        esac;

                        case second_list of 
                            casted_second : List => second_list_casted <- casted_second;
                            o : Object => new List;
                        esac;



                        result_list <- first_list_casted.append(second_list_casted);

                        lists <- lists.delete(first_number_int);

                        lists <- lists.delete(if first_number_int < second_number_int then second_number_int - 1 else second_number_int fi);

                        -- delete first and second list from lists

                        lists <- lists.append(new List.add(result_list));

                    } 
                else 
                    {
                        out_string("Nu s-a gasit comanda dorita merge parametrii\n");
                        abort();   
                    }
                fi
            else
                {
                    out_string("Nu s-a gasit comanda dorita de input\n");
                    out_string("Input line is:");
                    out_string(input_text);
                    if input_text = "" then out_string("input line is empty\n") else out_string("") fi;
                    abort();
                }

            fi fi fi fi fi fi;
            
            -- out_string("Please enter your command: ");
            somestr <- in_string();
        } pool
    };
};

