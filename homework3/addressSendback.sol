// SPDX-License-Identifier: None

pragma solidity 0.8.17;

contract newContract {
    address owner;

    constructor() public{
        owner = msg.sender;
    }

    function checkOwner () public view returns (address){
        if(msg.sender != owner){
            return msg.sender;
        }
        else{
            return 0x000000000000000000000000000000000000dEaD;
        }
    }
}