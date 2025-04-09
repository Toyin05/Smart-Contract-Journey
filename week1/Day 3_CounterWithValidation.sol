// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// A Counter Contract with Validations & Modifiers
/// Includes input validation and restricted access using modifiers
/// This contract builds on the previous counter contract (from Day 2) with enhanced safety

contract Counter {
    uint public count = 0;
    address public owner;

    // Set the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Modifier to restrict access to only the owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Access denied: Not the owner");
        _;
    }

    // Increments the counter (owner only)
    function increment() public onlyOwner {
        count += 1;

        // Check to ensure count remains positive
        assert(count >= 1);
    }

    // Decrements the counter (owner only)
    function decrement() public onlyOwner {
        require(count > 0, "Counter is already at zero");
        count -= 1;

        // Reject a specific count (example of revert usage)
        if (count == 13) {
            revert("Count value 13 is not allowed");
        }
    }
}
