# 🙋 Questions

1. True or False: we can prevent the heap being erased during upgrades by using a `stable` heap.

    **False**. The heap will allways be earased during upgrade but we will be able to use `preupgrade()` and `postupgrade` system hooks to transfer between heap and stable memory.

2. **A.call() -> B.call() -> C** How much time (or rounds of consensus) do we need to wait for an answer?

    ```text
    A.call() 
      -> 1 round for consensus -> 2s
    B.call() 
      -> 1 round for consensus -> 2s
    C
    ```

    => **2s, 2 rounds**

    source -> https://forum.dfinity.org/t/inter-canister-query-calls-community-consideration/6754

3. Is possible to realize an intercanister call in query mode?

    **False**, the documentation mentioned this. On a local replica it's possible under the following but only with the following conditions:

    - call target canister method is in query mode
    - source canister method is in non query mode
    - target canister method does not change state