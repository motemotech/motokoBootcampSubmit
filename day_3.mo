import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Iter "mo:base/Iter";

actor {
  //Challenge1 -> done
  private func swap(a : [var Nat], i : Nat, j : Nat) : async [Nat] {
    let tmp : Nat = a[i];

    a[i] := a[j];
    a[j] := tmp;

    return Array.freeze<Nat>(a);
  };

  //Challenge2 
  public func init_count(n : Nat) : async [Nat] {
    return Array.tabulate(n, func (i : Nat) : Nat {
      return i;
    });
  };

  //Challenge3
  public func seven(array : [Nat]) : async Text {
    for (i in Iter.range(0, array.size()-1)){
      if (array[i] == 7){
        return "Seven is found";
      };
    };
    return "Seven not found";
  };

  //Challenge4
  public func nat_opt_to_nat(n : ?Nat, m : Nat) : async ?Nat {
    if (n == null) {return ?m};
    return n;
  };

  //Challenge5
  public func day_of_the_week(n: Nat) : async ?Text {
    switch(n){
      case(1) {
        return ?"Monday";
      };
      case(2){
        return ?"Tuesday";
      };
      case(3){
        return ?"Wednesday";
      };
      case(4){
        return ?"Thursday";
      };
      case(5){
        return ?"Friday";
      };
      case(6){
        return ?"Saturday";
      };
      case(7){
        return ?"Sunday";
      };
      case(_){
        return null;
      };
    };
  };

  //Challenge6
  public func populate_array(array : [?Nat]) : async [Nat] {
    return Array.map(array, func (n : ?Nat) : Nat {
      switch(n){
        case(null) {
          return 0;
        };
        case(?something) {
          return something;
        };
      }; 
    });
  };

  //Challenge7
  public func sum_of_array(array : [Nat]) : async Nat {
    return Array.foldLeft(array, 0, func (acc : Nat, n : Nat) : Nat{
      return acc + n;
    });
  };

  //Challenge8
  public func squared_array(array : [Nat]) : async [Nat] {
    return Array.map(array, func (n : Nat) : Nat {
      return n * n;
    });
  };

  //Challenge9
  public func increase_by_index(array : [Nat]) : async [Nat] {
    return Array.mapEntries(array, func(n : Nat, i : Nat) : Nat {
      return n + i;
    });
  };

  //Challenge10
  public func contains<A>(array : [A], a : A, f(A:A) -> Bool) : async Bool {
    Array.find<A>(array, func (i : A) {
      if (i == a) {return true}
      else {return false};
    });
  };

};
