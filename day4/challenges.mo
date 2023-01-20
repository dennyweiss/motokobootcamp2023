import List "mo:base/List";
import Support "support";
import Debug "mo:base/Debug";
import Book "book";
import Bool "mo:base/Bool";
import Text "mo:base/Text";

actor {
  type Book = Book.Book;
  var list = List.nil<Book>();

  list := List.push({title = "1 The Hobbit"; pages = 310}, list);
  list := List.push({title = "4 The Hobbit 4"; pages = 310}, list);
  list := List.push({title = "2 The Hobbit 2"; pages = 310}, list);
  list := List.push({title = "3 The Hobbit 3"; pages = 310}, list);
  list := List.push({title = "4 The Hobbit 4"; pages = 310}, list);
  list := List.push({title = "5 The Hobbit"; pages = 310}, list);

  public func add_book(book : Book) : async () {
    list := List.push<Book>(book, list);
  };

  public query func get_books() : async [Book] {
    return List.toArray(list);
  };

  public query func getListOfBooks() : async List.List<Book> {
    return list;
  };

  public query func makeUnique() : async List.List<Book> {
    func booksAreEqual(s:Book,r:Book) : Bool {
       return Text.equal(s.title, r.title) and s.pages == r.pages;
    };
    return Support.unique<Book>( list, booksAreEqual );
  };

  public query func reverse()  : async List.List<Book> {
    var reversedList = List.nil<Book>();
    reversedList := Support.reverses<Book>(list);
    return reversedList;
  };

};
