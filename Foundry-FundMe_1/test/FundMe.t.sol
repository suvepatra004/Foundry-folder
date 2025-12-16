// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Test, console} from "forge-std/Test.sol";

contract FundMe is Test {

    uint256 number = 42;

    function setUp() external {
        number = 100;
    }

    function testExample() view public {
        console.log("Hello Foundry!");
        console.log('Number is:', number);
        assertEq(number, 100);
    }
}