## Week 1 – Smart Contract Journey
Welcome to Week 1 of my smart contract development journey. Here's a summary of what I learned and built each day.



## Day 1 – Counter Contract Basics
What I Learned:
- Data types like `uint`, `int`, `string`, `address`
- Writing simple functions
- Creating and updating a basic state variable
What I Built:
- A simple counter contract with `increment()` and `decrement()` functions.
File Name: `Day1_Counter.sol`



## Day 2 – Functions & State Logic
What I Learned:
- How functions work in Solidity
- Visibility types (public, private, internal, external)
- How state changes are recorded on the blockchain
What I Built:
- Expanded the counter contract with better formatting
- Understood function scope and gas implications
File Name: `Day2_CounterUpdated.sol`



## Day 3 – Validation & Access Control
What I Learned:
- Using `require()`, `assert()`, and `revert()` for validation
- Creating custom modifiers like `onlyOwner`
- Restricting function execution to the contract deployer
What I Built:
- An enhanced counter contract that’s safer and more realistic
File: Name: `Day3_CounterWithValidation.sol`



## Day 4 - Mappings & Structs
What I Learned
- How to use **structs** in Solidity to group related data (e.g., a candidate’s name and vote count).
- How **mappings** work for fast, gas-efficient storage and to retrieve values tied to specific keys (like a voter address or candidate ID).
- How to restrict voting using `require()` conditions and also to safely track state changes. 
- How to use a **modifier** to restrict access (meaning, only the contract owner can add candidates).
What I Built
- A simple decentralized voting system with the following:
- Anyone can vote **once** for a candidate.
- Only the contract **owner** can add candidates.
- Votes are recorded transparently and can be queried.
- Used mappings to store voters and candidates, and structs to represent each candidate.
File Name: `Day4_VotingContract.sol`



Every contract in this repo is a step in my journey to mastering Solidity and smart contract development
