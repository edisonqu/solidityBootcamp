// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/access/Ownable.sol";


contract VolcanoCoin is Ownable{
    uint256 totalSupply = 10000;

    constructor(){
        holdings[msg.sender] = totalSupply;
    }

    mapping(address => uint256) public holdings;

    function transfer (uint256 _amountTransferred, address _recipientAddress) public returns(uint256){

        holdings[msg.sender]= holdings[msg.sender] - _amountTransferred;
        holdings[_recipientAddress] = holdings[_recipientAddress] + _amountTransferred;

        return holdings[_recipientAddress];
    }

    function balance(address _user) public view returns(uint256){

        return holdings[_user];
    }


    event currentSupply(uint256);

    function retrieveTotalSupply() public view returns(uint256){
        return totalSupply;
    }

    function increaseTotalSupply() public onlyOwner{
        totalSupply = totalSupply+1000;
        emit currentSupply(totalSupply);
    }




}





