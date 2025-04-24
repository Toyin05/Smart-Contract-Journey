// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title AccessControl
/// @notice Provides onlyOwner access control

contract AccessControl {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    /// @notice Modifier to allow only owner to run specific functions
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    /// @notice Allows owner to transfer ownership
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid owner");
        owner = newOwner;
    }
}
