## Week 3 – Smart Contract Journey

Hello, welcome to Week 3 of my smart contract development journey. This week is focused on writing more secure and production-ready Solidity contracts by understanding how to handle errors, manage ETH safely, and build better user interactions through control flows.


## Day 1 – Error Handling in Solidity (require, revert, assert)

**What I Learned:**
- The role of `require` in validating inputs and access control.
- How `revert` can be used for custom errors and complex conditions.
- When to use `assert` to enforce internal logic and detect serious bugs.
- Proper error handling can prevent critical vulnerabilities and improve contract robustness.

**What I Built:**
- A simple wallet contract that allows deposits and withdrawals.
- Used `require` to ensure sufficient balance before withdrawals.
- Used `revert` to handle ETH transfer failures.
- Used `assert` to validate internal state and sanity checks.
- Included comments and structure for better readability and documentation.

**File Name:** 
`Day1_Wallet.sol`


## Day 2 – GasLogger.sol

**What I Learned:**
- How to use Solidity’s global variables: `msg.sender`, `block.timestamp`, `block.number`, and `gasleft()`
- How to store and manage log data on-chain using structs and dynamic arrays
- How to retrieve specific on-chain data via index-based access
- Importance of using `require` to prevent invalid array access

**What I Built:**
- A contract called `GasLogger` that tracks and stores real-time blockchain variables.
- Every time the `log()` function is called, it saves:
  - Who called the function (`msg.sender`)
  - The current block’s timestamp (`block.timestamp`)
  - The current block number (`block.number`)
  - Remaining gas at that point (`gasleft()`)

**File Name:**  
`Day2_GasLogger.sol`


## Day 3 – Fallback and Receive Functions

**What I Learned**
- Solidity’s `receive()` function handle ETH transfers with no accompanying data.
- The `fallback()` function catches:
  - Unknown calls (functions that don’t exist)
  - ETH transfers with data (when no `receive()` exists)
- These functions act as default handlers and are essential for guarding contracts from unexpected behavior.
- `receive()` and `fallback()` are both `external` and optionally `payable`, and can emit logs to trace interactions.
- Logging these events helps detect how ETH is being sent — expected vs. unexpected methods — which is critical for security and debugging.

**What I Built**
- A `FallbackReceiver` smart contract that:
  - Contains both `receive()` and `fallback()` functions.
  - Emits logs to distinguish between ETH received normally and via fallback scenarios.
  - Includes helper functions to:
    - Check contract balance
    - Withdraw accumulated ETH

**File Name:** `Day3_FallbackReceiver.sol`



Every contract in this repo is a step in my journey to mastering Solidity and smart contract development.
