import Book "book";
import List "mo:base/List";
import Bool "mo:base/Bool";
import Text "mo:base/Text";

actor {
    type Book = Book.Book;

    // 6. In main.mo import the type List from the Base Library and create a list that stores books.
    var list = List.nil<Book>();

    // 7.1 In main.mo create a function called add_book that takes a book as parameter and 
    //     returns nothing this function should add this book to your list.
    public func add_book(book : Book) : async () {
        list := List.push<Book>(book, list);
    };

    // 7.2 Then create a second function called get_books that takes no parameter 
    //     but returns an Array that contains all books stored in the list.
    public query func get_books() : async [Book] {
        return List.toArray(list);
    };

};