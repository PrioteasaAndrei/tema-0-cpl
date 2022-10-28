class List inherits IO{

    (* TODO: store data *)

    isEmpty() : Bool { true };

    -- 0, deși cod mort, este necesar pentru verificarea tipurilor

    -- TODO : scote abort de aici
    hd() : Object {
        {
            out_string("hd on empty list\n");
            abort();
            new Object; 
        }
    };

    -- Similar pentru self
    tl() : List { 
        {
            out_string("tl on empty list\n");
            abort(); 
            self;
        } 
    };

    add(o : Object): Cons {
        new Cons.init(o, self)
    };

    append(l : List) : List{
        l
    };

    toStringAux():String {
        " ]\n"
    };

    toString():String {
        ""
    };

    merge(other : List): List {
        -- self (* TODO *)
        other
    };

    filter(f : Filter): List {
        self (* TODO *)
    };

    -- sortBy(comparator : Comparator) : List{
    --     -- sortByAux(new List, comparator)
    -- };

    print() : IO { out_string("") };

    printListOfListsAll(index : Int, l : List): IO{
        out_string("\n")
    };

    debugPrint(l : List) : IO{
        out_string("\n")
    };

    get(index : Int) : Object{
        {
            out_string("get on empty list\n");
            abort();
            new Object;
        }
    };

    delete(i: Int): List {
        {
            out_string("get on empty list\n");
            abort();
            self;
        }
    
    };

    
    printAtIndex(recAux : Int, i : Int, l : List): IO{
        {
            out_string("Index doesn't exist\n");
            -- abort();    
        }
    };

    filterAtIndex(i : Int, l : List, filt : Filter) : List{
        {
            abort();
            new List;    
        }
    };


    sortByAux(accumulator : List, comparator : Comparator) : List{
        accumulator
    };

    insert(o : Object, comparator : Comparator) : Cons{
        new Cons.init(o,self)
    };

   sortAtIndex(i : Int, l : List, type : String, direction : String) : Object{
        {
            out_string("Aici clar daca intra am belit-o\n");
            abort();
            new Object;
        }
    };
};


class Cons inherits List {
    hd : Object;
    tl : List;
    empty : List;

    init(h : Object, t : List) : Cons {
        {
            hd <- h;
            tl <- t;
            self;
        }
    };

    -- Supradefinirea funcțiilor din clasa List
    isEmpty() : Bool { false };

    hd() : Object { hd };

    tl() : List { tl };

    -- implement get and delete

    -- indexate de la 1
    get(i: Int): Object {
		if i = 1 then
			hd
		else
			tl.get(i - 1)
		fi
	};

    delete(i: Int): List {
		if i = 1 then
			tl
		else
			init(hd, tl.delete(i - 1))
		fi
	};

    filter(f: Filter): List {
		if isEmpty() then
			self
		else if f.apply(hd) then
			new Cons.init(hd, tl.filter(f))
		else
			tl.filter(f)
		fi fi
	};

    -- merge 2 lists
    -- trebuie sa folosesti append nu add ca sa adaugi un element nou in lista
    append(l : List) : List {
        tl.append(l).add(hd)
    };

    sortBy(comparator : Comparator) : List{
        -- foloseste o lista goala pe care o va returna ca rezultat
        -- aici poate new Cons ? 
        sortByAux(new List,comparator)
    };

    -- aici poate fara self.isempty
    sortByAux(accumulator : List, comparator : Comparator) : List{
        if self.isEmpty() then 
            accumulator
        else
            tl.sortByAux(accumulator.insert(hd,comparator),comparator)
        fi
    };

    insert(o : Object, comparator : Comparator) : Cons{
        if self.isEmpty() then
            new Cons.init(o,self)
        else if comparator.compareTo(hd,o) then
            new Cons.init(hd,tl.insert(o,comparator))
        else
            new Cons.init(o,self)
        fi fi 
    };

    printFormat() : IO {
        {
            out_string("[ ");
            tl.print();
            out_string(" ]\n");
        }
    };


    toStringAux(): String{
        
            if self.isEmpty() then "[ ]" else 
                if (tl.isEmpty()) then
                let conv : A2I <- new A2I in 
                    case hd of
                        private : Private => private.toString().concat(" ]\n");
                        corporal : Corporal => corporal.toString().concat(" ]\n");
                        sergent : Sergent => sergent.toString().concat(" ]\n");
                        officer : Officer => officer.toString().concat(" ]\n");
                        soda : Soda => soda.toString().concat(" ]\n");
                        coffee : Coffee => coffee.toString().concat(" ]\n");
                        laptop : Laptop => laptop.toString().concat(" ]\n");
                        router : Router => router.toString().concat(" ]\n");
                        str : String => "String(".concat(str).concat(")").concat(" ]\n");
                        int : Int => "Int(".concat(conv.i2a(int)).concat(")").concat(" ]\n");
                        bool : Bool => "Bool(".concat("true").concat(")").concat(" ]\n");
                        io : IO => "IO()".concat(" ]\n");
                        -- lists: List => lists.toString().concat(", ").concat(tl.toStringAux());
                        obj : Object => "Object shouldn't be object.";
                    esac
            else
                let conv : A2I <- new A2I in 
                    case hd of
                        private : Private => private.toString().concat(", ").concat(tl.toStringAux());
                        corporal : Corporal => corporal.toString().concat(", ").concat(tl.toStringAux());
                        sergent : Sergent => sergent.toString().concat(", ").concat(tl.toStringAux());
                        officer : Officer => officer.toString().concat(", ").concat(tl.toStringAux());
                        soda : Soda => soda.toString().concat(", ").concat(tl.toStringAux());
                        coffee : Coffee => coffee.toString().concat(", ").concat(tl.toStringAux());
                        laptop : Laptop => laptop.toString().concat(", ").concat(tl.toStringAux());
                        router : Router => router.toString().concat(", ").concat(tl.toStringAux());
                        int : Int => "Int(".concat(conv.i2a(int)).concat(")").concat(", ").concat(tl.toStringAux());
                        bool : Bool => "Bool(".concat("true").concat(")").concat(", ").concat(tl.toStringAux());
                        str : String => "String(".concat(str).concat(")").concat(", ").concat(tl.toStringAux());
                        io : IO => "IO()".concat(", ").concat(tl.toStringAux());
                        -- lists: List => lists.toString().concat(", ").concat(tl.toStringAux());
                        obj : Object => "Object shouldn't be object.";
                    esac
            
            fi
        fi
        -- hd.toString().concat(", ").concat(tl.toStringAux());
    };

    toString(): String{
        "[ ".concat(self.toStringAux())
    };


    -- nu afiseaza nimic pentru ca e lista goala
    -- ai modificat List din Cons aici
    printListOfListsAll(index : Int, l : List): IO{
        {
            -- doar pentru lista initiala
            -- out_string(l.tl().hd().type_name());
            -- out_string("l is of type".concat(l.type_name()));
            -- out_string("l.hd() is of type".concat(l.hd().type_name()));
            case l.hd() of
                list : List => out_int(index).out_string(": ".concat(list.toString()));
                obj : Object => out_string("Error in print lists of all lists\n");
            esac;

            if (l.tl().isEmpty()) then out_string("") else printListOfListsAll(index + 1,l.tl()) fi;
            -- printListOfListsAll(index + 1,l.tl());
        }
    };

    printAtIndex(recAux : Int, i : Int, l : List): IO{
        if recAux < i then
            printAtIndex(recAux + 1 , i , l.tl())
        else
            case l.hd() of 
                casted_list : List => out_string(casted_list.toString());
                o : Object => out_string("ERROR AT CASTING\n");
            esac
        fi
    };


    -- initial returna Object
    -- problema e ca pe undeva returneaza object in loc de list
    filterAtIndex(i : Int, l : List, filt : Filter) : List{
        if i = 1 then
            -- replace first element
            case l.hd() of 
                casted_hd : List => l <- new Cons.init(casted_hd.filter(filt),l.tl());
                o : Object => {out_string("l.hd() is object in filter\n"); abort(); new List;};
            esac
        else
            -- aici poate l <- filter.. ?
            filterAtIndex(i - 1, l.tl(),filt)
        fi
    };

    sortAtIndex(i : Int, l : List, type : String, direction : String) : Object{
        let comparator : Comparator in
            {
                if type = "PriceComparator" then
                    comparator <- new PriceComparator.init(direction)
                else if type = "RankComparator" then
                    comparator <- new RankComparator.init(direction)
                else if type = "AlphabeticComparator" then
                    comparator <- new AlphabeticComparator.init(direction)
                else
                    self
                fi fi fi;

                sortAtIndexRec(i,comparator,l);
            } 
    };

    sortAtIndexRec(i : Int, comparator : Comparator, l : List) : Object{
        if i = 1 then
            case l.hd() of 
                casted_hd : Cons => l <- new Cons.init(casted_hd.sortBy(comparator),l.tl());
                o : Object => {out_string("l.hd() is object in sort\n"); abort(); new List;};
            esac
        else
            sortAtIndexRec(i-1,comparator,l.tl())
        fi
    };
};