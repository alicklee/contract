// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Lucky 7 game contract
contract EtherGame {
    // target amount to win the game
    uint private constant TARGET_AMOUNT = 7 ether;

    // winner address
    address public winner;

    uint private balance;

    // deposite ether begin game
    function deposit() public payable {
        // only 1 ether can be sent
        require(msg.value == 1 ether, "You can only send 1 Ether");

        // get balance of contract

        // if balance is greater than 7 ether, then game is over
        // and winner is the person who sent the last ether
        require(balance <= TARGET_AMOUNT, "Game is over");

        // if balance is 7 ether, then game is over
        // and winner is the person who sent the last ether
        if (balance == TARGET_AMOUNT) {
            winner = msg.sender;
        }
        // if contract balance is less than 7 ether, then game continues
    }

    // winner can claim their reward
    // winner is the person who sent the last ether
    // and contract balance is greater than 7 ether
    function claimReward() public {
        // check if is winner
        require(msg.sender == winner, "Not winner");

        // set the balace to 0
        balance = 0;

        // set winner to address(0)
        winner = address(0);

        // send all the ether to winner
        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether");
    }

    // check contract balance
    function getBalance()
        public
        view
        returns (uint varBalance, uint realBalance)
    {
        return (balance, address(this).balance);
    }
}
