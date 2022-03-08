import Nat "mo:base/Nat";
import Nat8 "mo:base/Nat8";
import Nat32 "mo:base/Nat32";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Array "mo:base/Array";

actor {

  //Challenge1 - done
  public func nat_to_nat8(n : Nat) : async Nat8 {
    return(Nat8.fromNat(n));
  };

  //Challenge2 - done
  public func max_number_with_n_bits(n : Nat) : async Nat {
    return(n * n);
  };

  //Challenge3 - done
  public func decimal_to_bits(n : Nat) :async Text {
    if (n == 0) {
      return "0";
    };

    var decimal : Nat = n;
    var ans : Text = "";

    while(decimal > 0) {
      ans := Nat.toText(decimal % 2) # ans;
      decimal := decimal / 2;
    };

    return ans;
  };

  //Challenge4 - done
  public func capitalize_character(c : Char) : async Char {
    var asc2 : Nat32 = Char.toNat32(c);
      if (Nat32.greaterOrEqual(asc2, 97) and Nat32.lessOrEqual(asc2, 122)) {
        return Char.fromNat32(asc2 - 32);
      };
    return c;
  };

  //Challenge5 - done
  public func capitalize_text(t : Text) : async Text {
    return Text.map(t, func (c : Char) : Char {
      return capitalize_character(c);
    });
  };
  
  //Challenge6 - done
  public func is_inside(t : Text, c : Char) : async Bool {
    for (char in t.chars()) {
      if(char == c) {
        return(true);
      };
    };
    return(false);
  };

  //Challenge7 - done
  public func trim_whitespace(t : Text) : async Text {
    var resText : Text = "";
    let ws : Char = ' ';
    for (char in t.chars()) {
      if (char != ws) {
        resText := resText # Char.toText(char);
      };
    };
    return(resText);
  };

  //Challenge8 - done
  public func duplicated_character(t : Text) : async Text {
    var chars : [Char] = Iter.toArray(t.chars());
      var last_idx : Nat = chars.size() - 1;
      for (i in Iter.range(0, last_idx)) {
        for (j in Iter.range(i + 1, last_idx)) {
          if (Char.equal(chars[i], chars[j])) {
            return Char.toText(chars[i]);
        };
      };
    };
    return t;
  };

  //Challenge9 - done
  public func size_in_bytes(t : Text) : async Nat {
    return Text.encodeUtf8(t).size();
  };

  //Challenge10 - done
  public func bubble_sort(array : [Nat]) : async [Nat] {
    var tmp1 = 0;
    var tmp2 = 0;
    let mArray : [var Nat] = Array.thaw<Nat>(array);

    for(i in Iter.range(0, array.size()-1)) {
      for(j in Iter.range(0, array.size()-2)) {
        tmp1 := mArray[j];
        tmp2 := mArray[j+1];
        if (tmp1 > tmp2) {
          mArray[j] := tmp2;
          mArray[j+1] := tmp1;
        };
      };
    };
    return Array.freeze<Nat>(mArray);
  };
};
