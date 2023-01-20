import List "mo:base/List";
import Buffer "mo:base/Buffer";
import Debug "mo:base/Debug";
import Option "mo:base/Option";
import Book "book";
import Array "mo:base/Array";

module {
  type Book = Book.Book; // can be removed
  type List<T> = List.List<T>;

  // 1. Write a function `unique` that takes a list l of type List<T> and
  //    returns a new list with all duplicate elements removed.
  //
  //    unique<T> : (l : List<T>, equal: (T,T) -> Bool) -> List<T>
  //
  public func unique<T>(l : List<T>, equal : (T, T) -> Bool) : List<T> {
    let sourceArray = List.toArray<T>(l);
    var resultBuffer = Buffer.Buffer<T>(0);

    func bufferContains<T>(item : T, buffer : Buffer.Buffer<T>, equal : (T, T) -> Bool) : Bool {
      for (bufferItem in buffer.vals()) {
        if (equal(item, bufferItem)) {
          return true;
        };
      };
      return false;
    };

    for (sourceItem in sourceArray.vals()) {
      if (resultBuffer.size() == 0 or bufferContains<T>(sourceItem, resultBuffer, equal) == false) {
        resultBuffer.add(sourceItem);
      };
    };

    return List.fromArray<T>(
      Buffer.toArray<T>(resultBuffer),
    );
  };

  // 2. Write a function `reverse` that takes l of type List\<T> and returns the reversed list.
  //
  //    reverse<T> : (l : List<T>) -> List<T>;
  //
  public func reverses<T>(l : List<T>) : List<T> {
    let sourceAsArray = List.toArray<T>(l);
    let reversedArray = Array.reverse<T>(sourceAsArray);
    return List.fromArray(reversedArray);
  };

  // 3. Write a function `is_anonymous` that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.
  //
  //     is_anynomous : () -> async Bool; 
  
};
