// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title FallbackReceiver
/// This contract demonstrates receive() and fallback() functions and secure ETH withdrawal

contract FallbackReceiver {
    // Owner of the contract
    address public owner;

    /// Emitted when ETH is received via the receive() function
    event Received(address sender, uint amount);

    /// Emitted when fallback() is triggered (e.g., non-existent function call or bad calldata)
    event FallbackCalled(address sender, uint amount, bytes data);

    /// Emitted when ETH is withdrawn from the contract
    event Withdrawn(address recipient, uint amount);

    /// Set the deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    /// Function to receive ETH when msg.data is empty
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    /// Fallback is called when msg.data is not empty or no function matches
    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }

    /// Withdraw ETH from the contract to the owner only
    /// @notice This is a secured withdrawal restricted to the contract owner
    function withdraw() external {
        require(msg.sender == owner, "Not the contract owner");
        uint amount = address(this).balance;
        payable(owner).transfer(amount);
        emit Withdrawn(owner, amount);
    }

    /// Check the current contract balance
    /// @return The ETH balance of this contract
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
