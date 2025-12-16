// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Test, console} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";

contract FundMeTest is Test {
    FundMe fundMe;
    uint256 number = 42;

    function setUp() external {
        number = 100;
        fundMe = new FundMe();
    }

    function testExample() view public {
        assertEq(number, 100);
    }

    function testMinimumUsd() public {
        // uint256 minimumUsd = fundMe.MINIMUM_USD();
        // assertEq(minimumUsd, 5e18);

        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }
}