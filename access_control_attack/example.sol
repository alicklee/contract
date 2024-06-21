// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Rubixi {
    //Declare variables for storage critical to contract
    uint private balance = 0;
    uint private collectedFees = 0;
    uint private feePercent = 10;
    uint private pyramidMultiplier = 300;
    uint private payoutOrder = 0;

    address private creator;

    //Sets creator
    function DynamicPyramid() {
        creator = msg.sender;
    }
}
