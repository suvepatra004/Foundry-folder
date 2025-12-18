// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";

contract DeployFundMe is Script {
    // This is a script file
    function run() external returns (FundMe) {
        vm.startBroadcast();
        FundMe fundMe = new FundMe(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        vm.stopBroadcast();
        return fundMe;
    }
}

/**
 * DeployFundMe Script
 * - This script deploys the FundMe contract to a specified network.
 * - I passed an Address to FundMe constructor which is a token address.
 * - That token address is of Sepolia ETH/USD Price Feed.
 */