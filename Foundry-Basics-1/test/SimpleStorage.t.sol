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
