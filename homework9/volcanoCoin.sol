// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;


import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract VolcanoCoin is Ownable{
    uint256 totalSupply = 10000;

    constructor(){
        holdings[msg.sender] = totalSupply;
    }

    mapping(address => uint256) public holdings;

    struct Payment{
        address theRecipient;
        uint256 transferredAmount;
    }

    Payment transactionRecord;

    mapping(address => Payment) findPayment;

    event transferSuccess(uint256 indexed _amount, address indexed recipient);

    function viewPayments(address _user) public view returns(address, uint256){
        return (findPayment[_user].theRecipient, findPayment[_user].transferredAmount);
    }

    function recordPayment(address _sender, address _receiver, uint256 _amount) internal {
        findPayment[_sender] = Payment(_receiver,_amount);
    }

    function transfer (uint256 _amountTransferred, address _recipientAddress) public returns(uint256){
        require(holdings[msg.sender] > _amountTransferred);
        holdings[msg.sender]= holdings[msg.sender] - _amountTransferred;
        holdings[_recipientAddress] = holdings[_recipientAddress] + _amountTransferred;
        // findPayment[msg.sender] = Payment(_recipientAddress, _amountTransferred);
        recordPayment(msg.sender, _recipientAddress, _amountTransferred);
        emit transferSuccess(_amountTransferred,_recipientAddress);
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





