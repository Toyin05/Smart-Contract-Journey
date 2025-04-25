// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Advanced Bank Contract
/// @notice This contract adds logging, access control, error handling, and fallback features

// Struct for transaction logs
struct Transaction {
    uint256 amount;
    string txType; // "Deposit" or "Withdraw"
    uint256 timestamp;
}

contract AdvancedBank {
    // Contract owner
    address public owner;

    // Mapping of user address to balance
    mapping(address => uint256) private balances;

    // Mapping of user to transaction history
    mapping(address => Transaction[]) private transactionLogs;

    // Total balance in the contract
    uint256 internal totalBalance;

    // Events
    event Deposit(address indexed user, uint256 amount);
    event Withdrawal(address indexed user, uint256 amount);

    // Modifier to restrict function to owner
    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    // Custom error for insufficient balance
    error InsufficientBalance(uint256 requested, uint256 available);

    // Constructor sets deployer as owner
    constructor() {
        owner = msg.sender;
    }

    // Public payable deposit function
    function deposit() public payable {
        require(msg.value > 0, "Must deposit more than 0");

        balances[msg.sender] += msg.value;
        totalBalance += msg.value;

        // Log transaction
        transactionLogs[msg.sender].push(Transaction({
            amount: msg.value,
            txType: "Deposit",
            timestamp: block.timestamp
        }));

        emit Deposit(msg.sender, msg.value);
    }

    // Withdraw Ether from contract
    function withdraw(uint256 amount) public {
        uint256 userBalance = balances[msg.sender];

        if (amount > userBalance) {
            revert InsufficientBalance({
                requested: amount,
                available: userBalance
            });
        }

        balances[msg.sender] -= amount;
        totalBalance -= amount;
        payable(msg.sender).transfer(amount);

        // Log transaction
        transactionLogs[msg.sender].push(Transaction({
            amount: amount,
            txType: "Withdraw",
            timestamp: block.timestamp
        }));

        emit Withdrawal(msg.sender, amount);
    }

    // View user's balance
    function getMyBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    // View total balance in contract (internal)
    function _getTotalBalance() internal view returns (uint256) {
        return totalBalance;
    }

    // View owner of contract
    function getOwner() public view returns (address) {
        return owner;
    }

    // View transaction history of caller
    function getMyTransactions() public view returns (Transaction[] memory) {
        return transactionLogs[msg.sender];
    }

    // Receive function for plain Ether transfers
    receive() external payable {
        deposit();
    }

    // Fallback function for unknown calls
    fallback() external payable {
        deposit();
    }
}
