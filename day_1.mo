import Nat "mo:base/Nat";
import Array "mo:base/Array";
import Prim "mo:⛔";
import Iter "mo:base/Iter";

actor {
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };

// Challenge1
  public func add(n : Nat, m : Nat) : async Nat {
    return (n + m);
  };

// Challenge2
  public func square(n : Nat) : async Nat {
    return (n * n);
  };

// Challenge3
  public func days_to_second(n : Nat) : async Nat {
    return (n * 24 * 60 * 60);
  };

// Challenge4
var cnt = 0;

public func increment_counter(n : Nat) : async Nat {
  cnt += n;
  return cnt;
};

public func clear_counter() : async () {
  cnt := 0;
};

// Challenge5
public func divide(n : Nat, m : Nat) : async Bool {
  if (n % m == 0) {
    return true;
  }else {
    return false;
  };
};

// Challenge6
public func is_even(n : Nat) : async Bool {
  if (n % 2 == 0){
    return true;
  }else {
    return false;
  };
};

// Challenge7
let array1 : [Nat] = [1, 2, 3, 4, 5];
let array2 : [Nat] = [];

public func sum_of_array(array : [Nat]) : async Nat {
  var res = 0;
  if (array.size() != 0){
    for(value in array.vals()){
      res += value;
    };
  }else {
    res := 0;
  };
  return res;
};

//Challenge8
public func maximum(array : [Nat]) : async Nat {
  var res = 0;
  if (array.size() != 0){
    for(value in array.vals()){
      if(value > res){
        res := value;
      };
    };
  }else {
    res := 0;
  };
  return res;
};

//Challenge9
public func remove_from_array(array : [Nat], n : Nat) : async [Nat] {
  return Array.filter(array, func (_n : Nat) : Bool {
    return _n !=  n;
  });
};

//Challenge10
public func selection_sort(array : [Nat]) : async [Nat] {
  var tmp1 = 0;
  var tmp2 = 0;
  var tmp3 = 0;
  let mArray : [var Nat] = Array.thaw<Nat>(array);

  for(i in Iter.range(0, array.size()-1)){
    tmp1 := mArray[i];
    tmp2 := mArray[i];
    for(j in Iter.range(i+1,array.size()-1)){
      if (tmp2 > array[j]) {
        tmp2 := mArray[j];
        tmp3 := j;
        mArray[j] := tmp1;
      };
    };

    mArray[i] := tmp2;
  };
    
  return Array.freeze<Nat>(mArray);
};

};
