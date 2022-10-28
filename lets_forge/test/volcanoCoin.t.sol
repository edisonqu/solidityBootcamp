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


    function test_retrieveTotalSupply() public {
        assertTrue(volcanoCoin.retrieveTotalSupply() == 10000);
    }

    function test_increaseTotalSupply() public {
        volcanoCoin.increaseTotalSupply();

        assertTrue(volcanoCoin.retrieveTotalSupply() == 11000);
    }

    function testFail_isOwner() public {
        vm.prank(address(0));
        volcanoCoin.increaseTotalSupply();

    }




}