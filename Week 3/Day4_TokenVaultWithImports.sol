// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./AccessControl.sol";
import "./VaultLib.sol";

/// @title TokenVault
/// This is a Token Vault contract that only the owner can withdraw from
/// This contract demonstrates modular contract structure with imports

contract TokenVault is AccessControl {
    using VaultLib for address payable;

    /// @notice Allow contract to receive Ether
    receive() external payable {}

    /// @notice Owner-only withdrawal function
    /// @param amount Amount of ether to withdraw
    function withdraw(uint amount) external onlyOwner {
        payable(msg.sender).safeWithdraw(amount);
    }

    /// @notice Returns the current balance of the vault
    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}
