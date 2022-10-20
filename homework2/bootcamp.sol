// SPDX-License-Identifier: None

pragma solidity 0.8.17;


contract BootcampContract {

    uint256 public score;

    address public owner; 

    mapping (address=> uint256) scoreList; 


    address[] keyList;

    modifier onlyOwner {
        if(msg.sender == owner){
            _;
        }
    }

    constructor() {
        owner = msg.sender;
    }

    uint256[] allPossibleNumber;
    uint256[9] oneNineDigitNumber; 

    struct Funder{
        address addr;
        uint256 amount;
    }

    Funder giver; 

    event scoreSet(uint256);
    event scoreSet2(uint256, address indexed);

    function setScore(uint256 newScore) public onlyOwner {
        score = newScore;
        giver.addr = msg.sender;
        giver.amount = 123;
        scoreList[msg.sender] = 54;
        emit scoreSet2(newScore, msg.sender);
    }


    function retrieve() public view returns (uint256){
        return score;
    }

    // view
    function getUserScore(address user) public view returns (uint256){
        return scoreList[user];
    }




}