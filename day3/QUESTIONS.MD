# Questions 🙋

1. True or False: the Internet Computer has a unique public key that can be used to verify responses coming from any subnets.  

    **True**  

2. True or False: when I realize an update call, the boundary node will participate in the consensus but not during query calls.  

   **False**. At any time, for an update call or for a simple query call, the bondary node participates by rooting the requests. They are intermediaries between the clients and the subnets, even if no consensus (query call) is necessary**  
  
3. True or False: I can create a certified variable that will certify the response of the following actor:  

    **True**

    Source : https://gist.github.com/nomeata/f325fcd2a6692df06e38adedf9ca1877

    cite from 👆:

    > Every now and then someone asks whether Motoko canisters can use certified variables, or whether they can serve HTTP requests with certification, and I always responded that yes, Motoko can do that, all that’s missing are a few libraries.

    ```motoko
    actor {
        public func hello(name : Text) : async Text {
            return ("hello # name");
        };
    }
    ```
