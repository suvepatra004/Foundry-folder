// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

import {Script, console2} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";

contract HelperConfig is Script {
    // If we're on local Anvil, deploy mocks
    // Else, grab the existing address from the network

    NetworkConfig public activeNetworkConfig; // State Variable

    struct NetworkConfig {
        address priceFeed; // eth or usd price feed address
    }

    // constructor, that will toggle and set the network configuration
    function testPriceFeedVersionIsAccurate() public {
        // if (block.chainid == 11155111) {
        //     activeNetworkConfig = getSepoliaETHConfig();
        // }
        if (block.chainid == 11155111) {
            activeNetworkConfig = getSepoliaETHConfig();
        }
    }

    // function of networkConfig for Sepolia Network
    function getSepoliaETHConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory sepoliaNetworkConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaNetworkConfig;
    }
    // function of networkConfig for Anvil Network
    // function of networkConfig for Mainnet Network
    function getMainnetETHConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory mainnetNetworkConfig = NetworkConfig({
            priceFeed: 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        });
        return mainnetNetworkConfig;
    }
}
