## Week 4 – Smart Contract Journey 

Welcome to Week 4 of my smart contract development journey. 
This week, I’exploring deeper, how Solidity structures data, handles efficient retrieval, and manages on-chain storage using advanced mappings, structs, and arrays.


## Day 1 – Structs, Mappings, and Arrays (Advanced)

**What I Learned:**
- Mastered how to use **structs** to group related data types together in Solidity smart contracts.
- Understood how **mappings** function as key-value stores for efficient data retrieval.
- Learned how **arrays** can be combined with mappings to retrieve and iterate over multiple stored values.
- Best practices when designing contracts that involve user registration and data management.

**What I Built:**
- A **Student Registry** smart contract.
- Allows users to register themselves by providing their name, age, and course.
- Uses a **struct** to store student details, a **mapping** for quick lookup by address, and an **array** to retrieve all registered student addresses.
- Practiced access control using `msg.sender` to ensure that each address can only register once.

**File Name:**  
`Day1_StudentRegistry.sol`



Every contract in this repo is a step in my journey to mastering Solidity and smart contract development.
