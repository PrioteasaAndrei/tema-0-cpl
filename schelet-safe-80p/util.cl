(* Think of these as abstract classes *)
class Comparator {
    compareTo(o1 : Object, o2 : Object):Bool {false};
};

class PriceComparator inherits Comparator {
    sort_direction: String;

    init(direction: String): SELF_TYPE {{
        sort_direction <- direction;
        self;
    }};

    compareTo(o1: Object, o2: Object): Bool {
        let price1: Int,
            price2: Int 
        in
            {
                case o1 of 
                    product : Product => price1 <- product.getPrice();
                    obj : Object => { abort(); 0;};
                esac;

                case o2 of 
                    product : Product => price2 <- product.getPrice();
                    obj : Object => { abort(); 0;};
                esac;


                if sort_direction = "descending" then
                    price2 < price1
                else
                    price1 < price2
                fi;
            }
            
    };

};

class RankComparator inherits Comparator {
    sort_direction: String;

    init(direction: String): SELF_TYPE {{
        sort_direction <- direction;
        self;
    }};

    compareTo(o1: Object, o2: Object): Bool {
        let rank1: Int,
            rank2: Int 
        in
            {
                case o1 of 
                    priv: Private => rank1 <- 0;
                    corp: Corporal => rank1 <- 1;
                    serg: Sergent =>  rank1 <- 2;
                    off: Officer =>  rank1 <- 3;
                esac;

                case o2 of 
                    priv: Private => rank2 <- 0;
                    corp: Corporal => rank2 <- 1;
                    serg: Sergent =>  rank2 <- 2;
                    off: Officer =>  rank2 <- 3;
                esac;

                if sort_direction = "descending" then
                    rank2 < rank1
                else
                    rank1 < rank2
                fi;
            }

    };

};

class AlphabeticComparator inherits Comparator {
    sort_direction: String;

    init(direction: String): SELF_TYPE {{
        sort_direction <- direction;
        self;
    }};

    compareTo(o1: Object, o2: Object): Bool {
        let s1: String,
            s2: String
        in
            {
                case o1 of
                    s: String => s1 <- s;
                    o: Object => {abort(); "";};
                esac;

                case o2 of
                    s: String => s2 <- s;
                    o: Object => {abort(); "";};
                esac;

                if sort_direction = "descending" then
                    s2 < s1
                else
                    s1 < s2
                fi;
            }

    };

};



class Filter {
    apply(o : Object):Bool {true};

};

(* TODO: implement specified comparators and filters*)

-- cast object to list

class ProductFilter inherits Filter {
    apply(o: Object): Bool {
        case o of
        product: Product => true;
        obj: Object => false;
        esac
    };
};

class RankFilter inherits Filter {
    apply(o: Object): Bool {
        case o of
        rank: Rank => true;
        obj: Object => false;
        esac
    };
};

class SamePriceFilter inherits Filter {
    apply(o: Object): Bool {
        case o of
        product: Product => product.getPrice() = product@Product.getPrice();
        obj: Object => false;
        esac
    };
};