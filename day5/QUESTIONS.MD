# 🙋 Questions

1. True or False: we can prevent the heap being erased during upgrades by using a `stable` heap.

    **False**. The heap will allways be earased during upgrade but we will be able to use `preupgrade()` and `postupgrade` system hooks to transfer between heap and stable memory.

2. **A.call() -> B.call() -> C** How much time (or rounds of consensus) do we need to wait for an answer?

    A.call() -> 2 rounds
    B.call() -> 2 rounds
    C -> 2 rounds

    -> 6 rounds 12s.

3. Is possible to realize an intercanister call in query mode?

    **False**, 