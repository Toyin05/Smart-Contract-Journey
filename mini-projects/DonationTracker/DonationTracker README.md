# DonationTracker - Secure ETH Donation Smart Contract

## Overview
The **DonationTracker** contract allows users to donate ETH securely within specified limits. The contract has built-in checks to ensure donations are within a range, and only the owner can withdraw the funds. It uses the **ReentrancyGuard** from OpenZeppelin to prevent reentrancy attacks, which ensures that the contract is safe from malicious hackers.

## Features
- **Minimum donation:** 0.001 ETH
- **Maximum donation:** 5 ETH
- **Only the owner can make withdrawals**
- **ReentrancyGuard to prevent reentrancy attacks**
- **Total donations tracked**

## How to Deploy

1. Clone the repository to your local machine or directly deploy using Remix IDE or Hardhat.
2. Deploy to a testnet like **Sepolia**.
3. Interact with the contract by donating ETH within the defined range (0.001 - 5 ETH).
4. Only the owner can withdraw funds.

## Example Usage

### 1. Deploy the contract
Deploy it to any Ethereum-compatible network (e.g., Sepolia).

### 2. Donate ETH
Anyone can donate between 0.001 and 5 ETH by calling the `donate()` function.

### 3. Withdraw Funds (Owner-only)
The owner can withdraw all the donations by calling the `withdraw()` function.

### 4. Check Contract Balance
Call the `getBalance()` function to check the total ETH collected in the contract.

## Security Considerations
- Only the contract owner can withdraw funds using the `onlyOwner` modifier.
- Donations are restricted within defined limits to avoid excessive gas consumption or overflows.
- The contract uses OpenZeppelin's **ReentrancyGuard** to avoid reentrancy attacks.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author
Toyin Ojumoro

## Contact
Feel free to connect with me via [LinkedIn](https://www.linkedin.com/in/toyin-ojumoro-25b394269?trk=contact-info) or [Twitter](https://x.com/toyin_bolu?t=8EuWbrCqIIjnfe4OUuupAg&s=09).

