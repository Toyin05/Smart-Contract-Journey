## Week3, Day 1 – Error Handling in Solidity

**What I Learned:**
- How `require` is used for input validation and pre-conditions.
- How `revert` provides custom error messages and is useful for complex conditions.
- How `assert` is mainly used to test for invariants and internal consistency.
- Why proper error handling is critical to avoid loss of funds and unexpected behavior in smart contracts.

**What I Built:**
- A basic Wallet contract that lets users deposit and withdraw ETH securely.
- Used `require` to validate deposits and prevent over-withdrawals.
- Used `revert` in case ETH transfer fails.
- Used `assert` to ensure the contract's ETH balance is never negative.
- Included comments and structure for better readability and documentation.

**File Name:**  
`Day1_Wallet.sol`
