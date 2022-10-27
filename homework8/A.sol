// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;


contract A{

    uint256 number;


    /** 
    @dev store value in variable
    @param num value to store
     */
    function store(uint256 num) public {
        number = num;
    }


    /**
    @dev retrieve and return the number inputted
    @return value of the number
     */
    function retrieve() public view returns (uint256){
        return number;
    }


}

