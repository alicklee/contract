// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Random {
    event Log(string);
    mapping(uint256 => bool) tokenId_luckys;

    constructor() payable {}

    // create random number
    function mint() public payable {
        // get random number
        bool randLucky = _getRandom();
        uint256 token_Id = _totalMinted();

        tokenId_luckys[token_Id] = randLucky;
        if (tokenId_luckys[token_Id] == true) {
            /*
         // source code
         require(payable(msg.sender).send((price * 190) / 100));
         require(payable(widthdrawAddress).send((price * 10) / 100));
         */

            // test code
            bool ok = payable(msg.sender).send(1 ether);
            if (!ok) {}
        }
    }

    // This is wrong random number generation
    // It is vulnerable to attack
    // Should Use a secure random number generation method like Chainlink VRF or Oraclize inside
    function _getRandom() private view returns (bool) {
        // Vulnerability code here
        // Random number generation
        uint256 random = uint256(
            keccak256(abi.encodePacked(block.difficulty, block.timestamp))
        );

        uint256 rand = random % 2;
        if (rand == 0) {
            return false;
        } else {
            return true;
        }
    }

    // get balance of pool
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    function _totalMinted() private pure returns (uint256) {
        return 1;
    }
}
