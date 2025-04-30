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


## Day 2 – Student Registry: Enhanced with Modifiers, Events & Custom Errors

**What I Learned:**
- How to use **modifiers** for access control (e.g., onlyOwner)
- The power of **events** for logging and dapp integrations
- How to use **custom errors** for cleaner, gas-efficient code

**What I Built:**
- Upgraded the Student Registry contract with:
  - Access control using `onlyOwner`
  - Event logs for `StudentRegistered` and `StudentRemoved`
  - Custom errors like `AlreadyRegistered`, `NotOwner`, etc.
- Removed students with admin permission and emitted logs

**File Name:**  
Day2_EnhancedStudentRegistry.sol


## Day 3 – ERC20 Token

**What I Learned:**
- ERC20 is a token standard that allows for fungible tokens on Ethereum.
- Using OpenZeppelin contracts makes development secure and standard-compliant.
- The `ERC20` base contract handles balances, transfers, and metadata.
- The `Ownable` module provides access control to functions like `mint()`.

**What I Built:**
- A custom ERC20 token called **MyToken (MTK)**.
- The token is mintable by the contract owner and fully transferable between users.
- Initial supply is 1000 MTK tokens minted to the deployer at contract creation.

**File Name:**
`Day3_Token.sol`


Every contract in this repo is a step in my journey to mastering Solidity and smart contract development.
