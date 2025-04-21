// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This is a S1imple ETH Wallet Contract
// This contract allows users to deposit and withdraw ETH securely.

contract Wallet {
    // Mapping an address to its ETH balance
    mapping(address => uint256) private balances;

    // Storing the owner of the contract
    address public owner;

    // Sets the deployer as the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Deposit ETH into the contract
    // Users can call this to fund their wallet
    function deposit() public payable {
        require(msg.value > 0, "You must deposit more than 0 ETH");
        balances[msg.sender] += msg.value;
    }

    // Withdraw ETH from the contract
    // @param _amount The amount of ETH (in wei) to withdraw
    // @notice Reverts if user tries to withdraw more than their balance
    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        balances[msg.sender] -= _amount;

        (bool success, ) = msg.sender.call{value: _amount}("");
        if (!success) {
            revert("ETH transfer failed");
        }
    }

    // Get the caller's current balance
    // @return The ETH balance of the caller
    function getMyBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Check contract ETH balance invariant
    // @notice Ensures that the contract balance is never negative
    function checkInvariant() public view {
        assert(address(this).balance >= 0);
    }

    // Receive function to accept ETH transfers
    receive() external payable {
        deposit();
    }
}
