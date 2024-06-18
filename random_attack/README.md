### Reason

All transactions executed within the same block share the same block properties (such as block difficulty and timestamp). Therefore, the random number generated by the Attack contract using block properties will be consistent with the random number generated by the Random contract using the same block properties.

### How to fix

By this method, the attacker can execute a series of operations within the same block and exploit the vulnerability in the target contract's random number generation. To prevent such attacks, more secure random number generation mechanisms, such as Chainlink VRF, should be used.