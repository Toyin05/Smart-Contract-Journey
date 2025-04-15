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

**File Name:** `Day2_Phonebook.sol`  


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

**File:** Name: `Day7_ElectionStructs&Enums.sol`



Every contract in this repo is a step in my journey to mastering Solidity and smart contract development.
