pragma solidity ^0.5.3;
import "./users.sol";

contract Auction is Users{
    
        uint internal key;
        string internal discription;
        string internal itemName;
        uint internal initialFee;
        bool internal itemStatus; 
        
    
    mapping (address => uint) SallerToItem;
    mapping (uint => address) ItemToSeller;
   
    uint[] bidders;
    
    function makeItem (string memory _discription, string memory _itemName, uint _initialFee) public{
        key = uint(keccak256(abi.encodePacked(_discription, _itemName, _initialFee, false)));
        discription = _discription;
        itemName = _itemName;
        initialFee = _initialFee;
        itemStatus = false;
        SallerToItem[_userAddress] = key;
        ItemToSeller[key] = _userAddress;
    }
    

    function bidtheItem(uint newFee, uint _buyer) public payable{
        require(users[_buyer].amount >= initialFee);
            initialFee+= newFee;
            bidders.push(_buyer);
    }
    
   function deleteItem() public{
        delete ItemToSeller[key];
        delete SallerToItem[_userAddress];
    }
    function getSallerToItem() public view returns (uint){
        return SallerToItem[_userAddress];
    }
    
    function getItemToSeller() public view returns (address){
        return ItemToSeller[key];
    }
    
    function getItemStatus() public view returns (bool){
        return itemStatus;
    }
    
    function getFee() public view returns (uint){
        return initialFee;
    }

    function getBuyer() public view returns(uint){
        return bidders[bidders.length-1];
    }

    function approveTheItem() payable public{
            require(getBuyer() == adressToUserId[msg.sender]);
            itemStatus = true;
    } 

}
