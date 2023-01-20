# Questions 🙋

1. Is the heap memory saved when upgrading a canister? How much heap memory does a canister has?

    **No**, a canister has a **heap of 4GiB**.

2. How much accounts can a unique Principal own?

    A principle can own a maximum of **4,294,967,295 acounts**.

3. Can we safely upgrade a canister from interface A to interface B?

    Interface A

    ```motoko
    actor {
      public func greet(surname : Text, firstname : Text) : async Text {
        return "Hello" # firstname # surname # " !";
      };
    }
    ```

    Interface B

    ```motoko
    actor {
      public func greet(firstname : Text) : async Text {
        return "Hello" # firstname # " !";
      };
    }
    ```

    **Yes**, because Interface B supports the same types as Interface A and only differ that a has an additional parameter that get silently ignored when provided in call of Interface B' `greet` function.
