// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Simple Counter Contract
/// @notice This contract allows incrementing and decrementing a counter value
/// @dev Basic example for understanding Solidity functions and state variables

contract Counter {
    // State variable to store the counter value
    uint public count = 0;

    // Increments the counter by 1
    function increment() public {
        count += 1;
    }

    // Decrements the counter by 1
    function decrement() public {
        count -= 1;
    }
}
