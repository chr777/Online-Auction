pragma solidity ^0.5.3;
import "./auction.sol";
import "./escrow.sol";

contract Payements is Auction, Escrow{
    
    function buy(uint _from) public{
     require(keccak256(abi.encodePacked(users[_from].status)) == keccak256(abi.encodePacked("buyer")));
     require(users[_from].amount >= initialFee);
     require(getBuyer() == _from);
     updateEscrowAmount(int(initialFee));
     users[_from].amount-=initialFee;
     deleteItem();
    } 
    
    
  function transfer(uint _to) public{
     require(keccak256(abi.encodePacked(users[_to].status)) == keccak256(abi.encodePacked("seller")));
     require(getEscrowAmount() >= initialFee);
     require(itemStatus == true);
     users[_to].amount+=initialFee;
     updateEscrowAmount(-int(initialFee));
     updateEscrowAmount(int(initialFee/10));
  }

}
