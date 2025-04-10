// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// A Simple Voting Contract
/// This contract allows users to vote for registered candidates
/// It Demonstrates the use of structs and mappings in Solidity

contract Voting {
    // Address of the contract owner
    address public owner;

    // Constructor sets the contract deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    // Candidate structure containing name and vote count
    struct Candidate {
        string name;
        uint voteCount;
    }

    // Mapping of candidate IDs to Candidate structs
    mapping(uint => Candidate) public candidates;
    // Mapping to track which addresses have voted
    mapping(address => bool) public hasVoted;

    // Counter for total number of candidates
    uint public candidatesCount = 0;

    // Modifier to restrict function access to owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    // Function to add a new candidate (owner only)
    function addCandidate(string memory _name) public onlyOwner {
        candidates[candidatesCount] = Candidate(_name, 0);
        candidatesCount++;
    }

    // Function to vote for a candidate
    function vote(uint _candidateId) public {
        require(!hasVoted[msg.sender], "You have already voted");
        require(_candidateId < candidatesCount, "Invalid candidate");

        hasVoted[msg.sender] = true;
        candidates[_candidateId].voteCount++;
    }

    // Function to get candidate details by ID
    function getCandidate(uint _candidateId) public view returns (string memory, uint) {
        require(_candidateId < candidatesCount, "Candidate does not exist");
        Candidate memory candidate = candidates[_candidateId];
        return (candidate.name, candidate.voteCount);
    }
}
