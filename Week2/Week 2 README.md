## Week 2 – Smart Contract Journey

Welcome to Week 2 of my smart contract development journey. This week, I’m diving deeper into how Solidity handles complex data structures and on-chain storage.

---

## Day 1 – Mappings in Solidity  
**What I Learned**  
- Deeper understanding on how to use **mappings** in Solidity to associate key-value data  
- Solidity mappings function like dictionaries — efficient for lookups but not iterable  
- How to build a **public phonebook** using addresses as keys and phone numbers as values  
- Practical limitations of mappings (e.g., no way to loop through keys) and how they impact smart contract design

**What I Built**  
- A mini on-chain **PhoneBook** contract  
- Allows users to store and retrieve phone numbers linked to their wallet address  
- This phonebook is an important concept and can be used to power things like user profiles, balances, and registry contracts

**File Name:** `Day1_Phonebook.sol`  


## Day 2 – Structs & Enums

**What I Learned:**
- How to define and use `structs` in Solidity to organize related data.
- How to define and switch between `enum` states (e.g., Registration, Voting, Ended).
- Writing cleaner contracts by separating roles and responsibilities.

**What I Built:**
- A simple Election contract using Structs & Enums.
- It allows an admin to add candidates, register voters, start/end voting, and tally results.
- Only registered voters can then vote during the voting phase.
- The winner is decided after tallying votes.

**File Name:** `Day2_ElectionStructs&Enums.sol`


## Day 3 – Constructors & Visibility

**What I Learned:**
- How constructors initialize contract state on deployment
- The differences between `public`, `private`, and `internal` visibility
- How to apply visibility to variables and functions to control access

**What I Built:**
- A basic Bank smart contract
- Constructor sets the deployer as the contract owner
- Uses visibility specifiers on variables and functions to demonstrate access control

**File Name:**  
`Day3_Bank.sol`


## Day 4 – Modifiers

**What I Learned:**
- How to use modifiers in Solidity to enforce access control.
- The `onlyOwner` modifier helps prevent unauthorized actions by restricting access to sensitive functions.
- Modifiers make the contract easier to read and maintain by centralizing access rules.

**What I Built:**
- I extended the existing `Bank.sol` contract by introducing a custom modifier called `onlyOwner`.
- Used this modifier to restrict the `withdraw()` function. This ensures that only the contract owner can perform withdrawals.
- Maintained good visibility practices with `public`, `private`, and `internal` variables.

**File Name:** `Day4_Modifiers.sol`


## Day 5 – Events & Logging in Solidity

**What I Learned:**
- How Solidity events work as on-chain logs.
- The importance of using `indexed` parameters for filtering logs.
- How to test and view event logs in the Remix console.
- That events help us track transactions without storing unnecessary data on-chain.

**What I Built:**
- Updated the bank contract to include `Deposit` and `Withdrawal` events.
- Events fire every time a user deposits or withdraws funds.
- Tested logs using the “Transactions” tab and Remix console.

**File Name:** `Day5_Events.sol`



Every contract in this repo is a step in my journey to mastering Solidity and smart contract development.
