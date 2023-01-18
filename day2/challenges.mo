import Float "mo:base/Float";
import Text "mo:base/Text";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Buffer "mo:base/Buffer";
import Array "mo:base/Array";
import Nat "mo:base/Nat";

actor {

  // 1. Write a function average_array that takes an array of integers and returns the average value of the elements in the array.
  public query func average_array(array : [Int]) : async Float {

      let count : Float = Float.fromInt( array.size());
      var sum : Float = 0.0;

      for( number in array.vals() ) {
        sum +=  Float.fromInt(number);
      };      

      let result = sum / count;

      return result;
  };
 
  // 2. Character count: Write a function that takes in a string and a character, and returns the number of occurrences of that character in the string.
  // count_character(t : Text, c : Char) -> async Nat
  public query func count_character(haystack : Text, needle : Char) : async Int {
      var count : Int = 0;

      for ( character in Text.toIter(haystack) ) {
        if ( Char.equal(character, needle) ) {
           count += 1;
        }  
      };

      return count;
  };

  // 3. Write a function factorial that takes a natural number n and returns the factorial of n.
  // factorial(n : Nat) ->  async Nat
  public query func factorial(base : Nat) : async Nat {
    
    var sum : Nat = 1;

    if ( base == 0 ) {
      return  0;
    };

    for (i in Iter.range(1, base) ) {
      sum *= i;
    };

    return sum;
  };

  // 4. Write a function number_of_words that takes a sentence and returns the number of words in the sentence.
  // number_of_words(t : Text) -> async Nat 
  public query func number_of_words(t : Text) : async Nat {
    type Pattern = Text.Pattern;
    let space : Pattern = #char(' ');

    var words : [Text] = Iter.toArray<Text>(Text.split(t, space))  ;

    return words.size();
  };

  // 5. Write a function find_duplicates that takes an array of natural numbers and returns a new array containing all duplicate numbers. The order of the elements in the returned array should be the same as the order of the first occurrence in the input array.
  // find_duplicates(a : [Nat]) -> async [Nat]
  public query func find_duplicates(numbers : [Nat]) : async [Nat] {
    let numbersBuffer = Buffer.fromArray<Nat>(numbers); 
    let resultBuffer = Buffer.Buffer<Nat>(1);

    for (number in numbers.vals()) {
         let size : Int = Array.filter<Nat>(numbers, func item = item == number).size();
         let contains : Int = Array.filter<Nat>(Buffer.toArray<Nat>(resultBuffer), func item = item == number).size();
      
         if (size > 1 and contains == 0) {
            resultBuffer.add(number);
         }
    };

    return Buffer.toArray<Nat>(resultBuffer);
  };

  // 6. Write a function convert_to_binary that takes a natural number n and returns a string representing the binary representation of n.
  // convert_to_binary(n : Nat) -> async Text
  public query func convert_to_binary(number : Nat) : async Text {
    var mutableNumber : Nat = number;
    var remain : Nat = 0;
    var stringRepresentation : Text = "";

    while (mutableNumber > 0) {
      remain := mutableNumber % 2;
      stringRepresentation := Nat.toText(remain) #stringRepresentation;
      mutableNumber := mutableNumber / 2;
    };

    return stringRepresentation;
  };

}