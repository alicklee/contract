## Self-destruct vulnerabilities

### Reason

We know that in Solidity, there are three methods to send ETH: send, transfer, and call. Besides these three methods, there is another way to send ETH, which is through the self-destruct function. This is a very covert method of sending ETH.

### How to fix

The key to solving a self-destruct function attack is to avoid using the account balance as a condition. We can define a state variable to record the balance of the game funds, which can be controlled by the developer. Following this approach, the code of the game contract can be fixed as fix.sol
