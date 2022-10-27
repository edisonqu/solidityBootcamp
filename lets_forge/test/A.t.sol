// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;


// Standard test libs
import "forge-std/Test.sol";
import "forge-std/Vm.sol";

// Contract under test
import {A} from "../src/A.sol";

contract ATest is Test{
    A private a;



    function setUp() public {
        // new contract instance
        a = new A();
    }

    function test_Log() public {
        //logs

        emit log("ready");
        emit log_address(address(this));
         // HEVM_ADDRESS is a special reserved address for the VM
        emit log_address(HEVM_ADDRESS);

    }

    function test_GetValue() public {
        assertTrue(a.retrieve() ==0);
    }


    function test_SetValue() public {
        uint x = 123;
        a.store(x);
        assertTrue(a.retrieve() == 123);

    }

    function test_FuzzValue(uint _value) public {
        _value = bound(_value, 0,99999);

        a.store(_value);

        assertTrue(a.retrieve() == _value);
    }
}