// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Bank {
    // Address of the contract owner
    address public owner;

    // Mapping to store user balances (private)
    mapping(address => uint256) private balances;

    // Total balance in the contract 
    uint256 internal totalBalance;

    // Set the deployer as the owner using constructor
    constructor() {
        owner = msg.sender;
    }

    // Deposit Ether into the contract
    function deposit() public payable {
        balances[msg.sender] += msg.value;
        totalBalance += msg.value;
    }

    // Withdraw specified amount of Ether
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        totalBalance -= amount;
        payable(msg.sender).transfer(amount);
    }

    // Functiom to get the caller’s balance
    function getMyBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // Internal function to view total contract balance
    function _getTotalBalance() internal view returns (uint256) {
        return totalBalance;
    }

    // Get the contract owner
    function getOwner() public view returns (address) {
        return owner;
    }
}
