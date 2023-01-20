# Coding challenges 🧑‍💻

1. Write a function `unique` that takes a list l of type List\<T> and returns a new list with all duplicate elements removed.

    ```motoko
    unique<T> : (l : List<T>, equal: (T,T) -> Bool) -> List<T> 
    ```

2. Write a function `reverse` that takes l of type List\<T> and returns the reversed list.

    ```motoko
    reverse<T> : (l : List<T>) -> List<T>;
    ```

3. Write a function `is_anonymous` that takes no arguments but returns a Boolean indicating if the caller is anonymous or not.

    ```motoko
    is_anynomous : () -> async Bool; 
    ```

4. Write a function `find_in_buffer` that takes two arguments, buf of type **Buffer** and val of type **T**, and returns the optional index of the first occurrence of "val" in "buf".

    ```motoko
    find_in_buffer<T> :  (buf: Buffer.Buffer<T>, val: T, equal: (T,T) -> Bool) -> ?Nat
    ```

5. Take a look at the code we've seen before in this guide:

    ```motoko
    import HashMap "mo:base/HashMap";
    import Iter "mo:base/Iter";
    import Principal "mo:base/Principal";
    actor {

        let usernames = HashMap.HashMap<Principal, Text>(0, Principal.equal, Principal.hash);

        public shared ({ caller }) func add_username(name : Text) : async () {
          usernames.put(caller, name);
        };


    };
    ```

    Add a function called `get_usernames` that will return an array of tuples (Principal, Text) which contains all the entries in usernames.

    ```motoko
    get_usernames : () -> async [(Principal, Text)];
    ```
