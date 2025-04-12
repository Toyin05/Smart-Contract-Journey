## Day 4 – Voting Contract (Security Review)

This contract simulates a decentralized voting system with real-world logic and security in mind.

### Concepts Implemented
- **Structs** to represent each candidate with their name and vote count.
- **Mappings** to manage candidates and track voter participation.
- **Access Control** with custom `onlyOwner` modifier — only the contract deployer can add candidates.
- **Validation** using `require()` to ensure:
  - Only one vote per address.
  - Candidates can’t be voted for unless they exist.

### Key Features
- On-chain candidate registration (owner-only).
- Transparent vote tracking and result retrieval.
- Protection against double voting and unauthorized access.

### Why This Matters
This contract is a foundation for real-world DAO governance, elections, polls, and decentralized reputation systems.

**File:** `Day4_VotingContract.sol`
