pragma solidity ^0.5.3;

contract Users{
    address internal _userAddress;
    uint internal userId;
    
    struct user{
    string name;
    uint amount;
    string status;
    }
    
    mapping (address => user) adressToUser;
    mapping (uint => address) UserToAddress;
    mapping (address => uint) adressToUserId;
    
    user[] public users;
    
    function setUserAddress(address userAddress) public{
         _userAddress = userAddress;
         adressToUserId[_userAddress] = userId;
    }
    
    function makeUser(string memory _name, uint _amount, string memory _status) public{
        userId = users.push(user(_name, _amount, _status))-1;
        adressToUser[_userAddress] = user({name: _name, amount:_amount, status:_status});
        UserToAddress[userId] = _userAddress;
    }
    
    function getUserId() public view returns(uint){
        return userId;
    }
}



