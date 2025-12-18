// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    HelperConfig helperConfig = new HelperConfig();
    address ethUsdPriceFeed = helperConfig.activeNetworkConfig();

    // This is a script file
    function run() external returns (FundMe) {
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ethUsdPriceFeed);
        vm.stopBroadcast();
        return fundMe;
    }
}

/**
 * =========== DeployFundMe Script ==========
 *
 * - This script deploys the FundMe contract to a specified network.
 * - I passed an Address to FundMe constructor which is a token address.
 * - That token address is of Sepolia ETH/USD Price Feed.
 *
 * =========== "vm.startBroadcast()" and "vm.stopBroadcast()" ==========
 * - These functions are used to indicate the start and stop of broadcasting transactions to the network.
 * - After vm.startBroadcast(), any contract deployment or transaction will be sent to the network.
 * - Before vm.startBroadcast(), no transactions are broadcasted; they are just simulated and free of cost.
 */
