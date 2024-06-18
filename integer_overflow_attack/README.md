## Integer Overflow Attack

### Reason

uint256 type variable can overflow, if it overflow it will be reset to zero

### How to fix

1. upgrade solidity version to 0.8.0 or higher
2. use SafeMath library
