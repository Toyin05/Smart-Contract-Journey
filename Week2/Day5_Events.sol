// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bank {
    // State variable to store the owner of the contract
    address public owner;

    // Mapping to store each user's balance
    mapping(address => uint256) public balances;

    // Events for logging, depositing and withdrawal activities
    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);

    // Modifier to restrict functions to the contract owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    // Constructor sets the deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Deposit Ether into the contract
    function deposit() public payable {
        require(msg.value > 0, "Must deposit more than 0");

        // Increase the sender's balance
        balances[msg.sender] += msg.value;

        // Emit a deposit event
        emit Deposit(msg.sender, msg.value);
    }

    // Withdraw specified amount of Ether
    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        // Decrease the sender's balance
        balances[msg.sender] -= _amount;

        // Transfer Ether to the sender
        payable(msg.sender).transfer(_amount);

        // Emit a withdrawal event
        emit Withdrawal(msg.sender, _amount);
    }

    // View the total balance in the contract (only for owner)
    function getContractBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }
}
