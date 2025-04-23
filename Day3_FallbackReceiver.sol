// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title FallbackReceiver - Demonstrates fallback and receive functions in Solidity
/// @notice This contract logs expected and unexpected ETH transfers and allows simulations

contract FallbackReceiver {
    /// Emitted when ETH is received via the receive() function
    event ReceivedETH(address indexed sender, uint256 amount);

    /// Emitted when fallback() is triggered (e.g., unexpected data or unknown function)
    event FallbackCalled(address indexed sender, uint256 amount, bytes data);

    /// This function is called when ETH is sent with empty calldata
    /// @notice Handles plain ETH transfers (e.g., `address(contract).transfer(amount)`)
    receive() external payable {
        emit ReceivedETH(msg.sender, msg.value);
    }

    /// This function is called when calldata doesn't match any function or contains data
    /// @notice Handles unexpected calls and logs the details
    fallback() external payable {
        emit FallbackCalled(msg.sender, msg.value, msg.data);
    }

    /// Check the ETH balance of this contract
    /// @return The contract’s balance in wei
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    /// Withdraw ETH from the contract to the caller
    /// @notice Only for demonstration; allows anyone to withdraw all ETH
    function withdraw() public {
        payable(msg.sender).transfer(address(this).balance);
    }
}
