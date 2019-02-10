pragma solidity ^0.5.3;

contract Escrow {
    address internal escrowAddress;
    uint private account;
    
    function setadminAddress(address _escrowAddress) public{
        escrowAddress = _escrowAddress;
    }
    
    function updateEscrowAmount(int amount) payable public { 
        account = uint(int(account) + amount); 
    }
    function getEscrowAmount() public view returns (uint){
        return account;
    }
    
    
}
