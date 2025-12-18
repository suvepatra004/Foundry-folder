// SPDX-License-Identifier: MIT
pragma solidity ^0.8.21;

// Note: The AggregatorV3Interface might be at a different location than what was in the video!
import {AggregatorV3Interface} from "@chainlink/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./PriceConverter.sol";

error NotOwner();

/**
 * @title Fund Me
 * @author Suvendu
 * @notice For creating a sample funding contract
 * @dev This implements price feeds as our library
 */

contract FundMe {

    // using PriceConverter for uint256;

    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders;

    // Could we make this constant?  /* hint: no! We should make it immutable! */
    address public immutable iOwner;
    uint256 public constant MINIMUM_USD = 5e18;
    AggregatorV3Interface private s_PriceFeed;

    constructor(address priceFeed) {
        iOwner = msg.sender;
        s_PriceFeed = AggregatorV3Interface(priceFeed);
    }

    // uint256 public myValue = 1;

    function fund() public payable {
        /* This fund() function will fund the contract with some minimum ETH amount -> 1ETH
           The Condition says, it only requires > 1 ETH/1e9 Gwei/1e18Wei
         */

        // Allow users to send $
        // Have a minimum $ sent

        // myValue = myValue + 4; // When the fund reverts this myValue won't change
        // Fund sending to Contract
        // require(msg.value > 1e18, "Not Enough fund");

        /*
            - What is Revert?
            - undo any actions that has been done for a transaction, and send the remaining gas back.
        */

        // require(PriceConverter.getConversionRate(msg.value) >= MINIMUM_USD, "You need to spend more ETH!");
        // require(
        //     msg.value.getConversionRate(s_PriceFeed) >= MINIMUM_USD,
        //     "Need to spend more ETH"
        // );
        addressToAmountFunded[msg.sender] += msg.value;
        funders.push(msg.sender);
    }

    // Get the version of the price feed
    function getVersion() public view returns (uint256) {
        return s_PriceFeed.version();
    }

    modifier onlyOwner() {
        // require(msg.sender == owner);
        if (msg.sender != iOwner) revert NotOwner();
        _;

    }

    function withdraw() public onlyOwner {
        for (uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        // // transfer
        // payable(msg.sender).transfer(address(this).balance);

        // // send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send failed");

        // call
        (bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call failed");
    }

    // Explainer from: https://solidity-by-example.org/fallback/
    // Ether is sent to contract
    //      is msg.data empty?
    //          /   \
    //         yes  no
    //         /     \
    //    receive()?  fallback()
    //     /   \
    //   yes   no
    //  /        \
    //receive()  fallback()

    fallback() external payable {
        fund();
    }

    receive() external payable {
        fund();
    }
}

