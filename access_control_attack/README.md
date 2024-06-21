## Access Control Attack

### Reason

For old version the fuction has the same name with contract's name means the construct funciton like other language(e.g. Java)
So if change the contract name to other name, but forget change the function name, the old version function become to the public function everyone can call.

### How to fix it

1. use the construct function inside the same name function
2. check all params and function's access,make sure tthe params and function's access is correct
3. use \_xxx to name the private or internal function
