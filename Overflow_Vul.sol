// SPDX-License-Identifier: MIT
pragma solidity 0.6.6;

contract OverFlow_Vuln {
    mapping (address=>uint) balances; 

    function batchTransfer(address[] memory receivers, uint256 value) public payable returns (bool) {
        uint cnt = receivers.length;
        uint256 amount = uint256(cnt) * value;
        require(cnt > 0 && cnt <= 20);
        require(value > 0 && balances[msg.sender] >= amount);

        balances[msg.sender] = balances[msg.sender] - amount;
        for (uint i = 0; i < cnt; i++) {
            balances[receivers[i]] = balances[receivers[i]] + value;
        }
        return true;
    }

        function deposit() public payable{
            balances[msg.sender] = msg.value;
        }

        function getBalance() public view returns (uint){
            return balances[msg.sender];
        }
}