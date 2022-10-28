// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


// Standard test libs
import "forge-std/Test.sol";
import "forge-std/Vm.sol";

// Contract under test
import {VolcanoCoin} from "../src/volcanoCoin.sol";

contract testingVolcanoCoin is Test{
    VolcanoCoin volcanoCoin;

    function setUp() public {
        volcanoCoin = new VolcanoCoin();
    }


    function test_Log() public {
        //logs

        emit log("ready");
        emit log_address(address(this));
         // HEVM_ADDRESS is a special reserved address for the VM
        emit log_address(HEVM_ADDRESS);

    }


    // function test_balance(address _holder) public view returns(address){
    //     address _owner = msg.sender;
    //     assertTrue(volcanoCoin.balance(_holder) == _owner);

    // }
    function test_retrieveTotalSupply() public {
        uint256 _initialSupply = 10000;
        emit log_address(HEVM_ADDRESS);
        assertTrue(volcanoCoin.retrieveTotalSupply() == 10000);

    }


}