## Question 1: 
How much is the current memory capacity of a canister?

### Answer:
It depends on the view what a canister could contain if the capacity of a subnet is meant. The stable memory capacity of a canister is 48 GB and a subnet can reach 450 GB for now. I discovered the values through insection of the http://github.com/dfinity/ic commit `ed833f2d1aff1e7808f973c4b47b432ba3278df6` and found the following values:

1. MAX_STABLE_MEMORY_IN_BYTES
`rs/types/types/src/lib.rs:539` ➡️  **48 GB** 
2. MAX_WASM_MEMORY_IN_BYTES
`rs/types/types/src/lib.rs:554` ➡️ **4 GB**
3. SUBNET_MEMORY_CAPACITY
`rs/config/src/execution_environment.rs` ➡️ **450 GB**

## Question 2: 
What is the issue with the following code sample?

### Answer:
The actors counter variable should be declared as mutable variable because the `increment_counter` update call mutates its state. So, we have to use the 'var' keyword.

## Question 3: 
What is the issue with the following code sample?

### Answer:
The message variable mutating method `change_message` is an update call, so we have to remove the `query` keyword. 
Furthermore, the `return` statement is not required in the `change_message` update call.  
In this case we can remove the `return` statement of the `see_message` query because the last statement of the method body gets returned anyway.

## Question 4:
False or True: we can remove the keyword async for return argument of a query function since queries are faster to answer.

### Answer:
False, we can only remove the `async` when it's a canister internal function. 
