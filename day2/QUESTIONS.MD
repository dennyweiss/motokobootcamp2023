1. Who controls the ledger canister?

    A ledger is a canister and canisters are controlled by principals with the controller role or other canisters

2. What is the subnet of the canister with the id: `mwrha-maaaa-aaaab-qabqq-cai`? How much nodes are running this subnet?

    **Steps to solution:**

    1. https://icscan.io/canister/mwrha-maaaa-aaaab-qabqq-cai
    2. https://icscan.io/principal/k3f6a-5uxhv-dqjj6-762lc-yazgp-drpws-a35e7-wf27k-ujuio-ye2lh-xqe
    3. https://icscan.io/subnet/pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe

    **Solution**: 16 nodes are in the subnet `pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe` where `mwrha-maaaa-aaaab-qabqq-cai` is one of 15 canisters

3. I have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?

    > mentioned in https://nns.ic0.app/neuron:
    >
    > (ICP staked + maturity staked) x Dissolve Delay Bonus x Age Bonus
    > (10 + 0) * 1.25 x 1.12 = 14.0 voting power

    **Solution**: The expected voting power is 14.0.

4. What is wrong with the following code?

    - import of Nat is missing `import Nat "mo:base/Nat";`
    - transform message to a query call
    - global vars  `n` & `t` arn't required and subject to deletion
    
    ```motoko
    import Nat "mo:base/Nat";
    
    actor {
     public query func convert_to_text(m : Nat) : async Text {
       Nat.toText(m);
     };
    }
    ```

5. What is wrong with the following code?

    - languages var isn't mutated so we should change `var` to `let`
    - languages array items aren't nutated we should make the array immutable (remove `var`)
    - we can simply implicit return languages array
    
    ```motoko
    public query func show_languages() : async [Text] {
       languages;
     };
    ```

6. What is wrong with the following code?

    - "mo:base/Array" import is missing
    
    ```motoko
    import Array "mo:base/Array";
    
    actor {
      var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];
    
      public func add_language(new_language: Text) : async [Text] {
        languages := Array.append<Text>(languages, [new_language]);
        return (languages);
      };
     
    }
    ```

    or even better and replace `Array.append()`

    ```motoko
    import Array "mo:base/Array";
    import Buffer "mo:base/Buffer";
    
    actor {
      var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];
    
      public func add_language(new_language: Text) : async [Text] {
        var b : Buffer.Buffer<Text> = Buffer.fromArray<Text>(languages);
        b.add(new_language);
        languages := Buffer.toArray(b);
        return (languages);
      };
     
    }
    ```
