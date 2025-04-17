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

    // Custom modifier to restrict access to only the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Access denied: Only owner can perform this action");
        _;
    }

    // Deposit Ether into the contract
    function deposit() public payable {
        balances[msg.sender] += msg.value;
        totalBalance += msg.value;
    }

    // Withdraw specified amount of Ether — restricted to onlyOwner
    function withdraw(uint256 amount) public onlyOwner {
        require(address(this).balance >= amount, "Insufficient contract balance");
        totalBalance -= amount;
        payable(msg.sender).transfer(amount);
    }

    // Function to get the caller’s balance
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
