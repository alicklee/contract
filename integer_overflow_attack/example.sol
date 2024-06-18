// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract BECOverflow {
    // 合约的内部账本，用来记录每一个账户地址的余额
    mapping(address => uint256) balances;

    // 批量转账，_receivers是接收者的地址，_value是转给每个人的代币数量
    function batchTransfer(
        address[] calldata _receivers,
        uint256 _value
    ) public payable returns (bool) {
        uint cnt = _receivers.length;

        // 计算转账人应该扣除的代币总数量
        uint256 amount = uint256(cnt) * _value; //整数溢出漏洞点

        // 如果接收者为空，或者接收者多于20个，终止回退
        require(cnt > 0 && cnt <= 20);

        // 保证转账人在合约中的余额，要大于等于转账总额
        require(_value > 0 && balances[msg.sender] >= amount);

        // 转账人在合约中的余额减掉本次的转账总额
        balances[msg.sender] = balances[msg.sender] - amount;
        for (uint i = 0; i < cnt; i++) {
            // 给每一个接收人的账户，增加代币value个代币
            balances[_receivers[i]] = balances[_receivers[i]] + _value;
            // 执行实际的转账操作
            //Transfer(msg.sender, _receivers[i], _value);
            payable(_receivers[i]).transfer(1 ether);
        }
        return true;
    }

    constructor() payable {}
}
