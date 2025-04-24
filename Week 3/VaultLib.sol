// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title VaultLib
/// @notice Library with reusable vault logic
library VaultLib {
    /// @notice Safely withdraw ether from a contract
    /// @param recipient The address receiving the ether
    /// @param amount The amount of ether to withdraw
    function safeWithdraw(address payable recipient, uint amount) internal {
        require(address(this).balance >= amount, "Insufficient balance");
        (bool sent, ) = recipient.call{value: amount}("");
        require(sent, "Transfer failed");
    }
}
