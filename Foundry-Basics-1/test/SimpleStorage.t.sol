// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/SimpleStorage.sol";

contract SimpleStorageTest is Test {
    SimpleStorage simple;

    function setUp() public {
        simple = new SimpleStorage();
    }

    function testStoreAndRetrieve() public {
        simple.store(123);
        assertEq(simple.retrieve(), 123);
    }

    function testAddPerson() public {
        simple.addPerson("Alice", 10);

        // listOfPeople(0) returns the Person struct at index 0.
        (uint256 favNum, string memory name) = simple.listOfPeople(0);

        assertEq(favNum, 10);
        assertEq(name, "Alice");

        // check mapping too
        assertEq(simple.nameToFavoriteNumber("Alice"), 10);
    }
}

/**
 * 
 * ======== Running Tests and Deployment Commands ========
 * 
 * ----- To run the tests, use the command -----
 * forge test --contracts test/SimpleStorage.t.sol
 * 
 * ------ To Deploy the contract, use the command ------
 * forge script script/DeploySimpleStorage.s.sol --broadcast
 * 
 * ------ Deploy using PRIVATE_KEY and RPC_URL set in the .env file ------
 * forge script script/DeploySimpleStorage.s.sol --broadcast --private-key $PRIVATE_KEY --rpc-url $RPC_URL
 * 
 * ------ Securing PRIVATE_Key using Cast Keystore command ----------
 * cast wallet import <Private_Key_Name> --interactive (Enter Private Key:) then (Enter Password:)
 * 
 * ------ Deploy using Cast Keystore ------
 * forge script script/DeploySimpleStorage.s.sol --broadcast --rpc-url $RPC_URL --account <Private_Key_Name> --sender <Private_Key Sender Address>
 * 
 * 
 * ========= Broadcast Folder =========
 * It store the deployment and transaction details in the broadcast folder.
 * After running the deploy script, check the broadcast/<Contract_Name> folder for details.
 * ====================================
 * 
 * 
 */