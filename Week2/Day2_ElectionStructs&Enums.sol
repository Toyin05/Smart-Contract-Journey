// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract ElectionStructs {
    // Address of the contract deployer
    address public admin;

    // Enum representing current election state
    enum ElectionState { Registration, Voting, Ended }
    ElectionState public currentState;

    // Struct to hold candidate details
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Struct to hold voter details
    struct Voter {
        bool isRegistered;
        bool hasVoted;
        uint votedCandidateId;
    }

    // Mapping of address to voter details
    mapping(address => Voter) public voters;

    // An array to store all candidates
    Candidate[] public candidates;

    // Set deployer as admin and initialize election state
    constructor() {
        admin = msg.sender;
        currentState = ElectionState.Registration;
    }

    // Modifier to restrict access to admin only
    modifier onlyAdmin() {
        require(msg.sender == admin, "Only admin can perform this action");
        _;
    }

    // Modifier to ensure the function is called in a specific election state
    modifier inState(ElectionState state) {
        require(currentState == state, "Invalid election state");
        _;
    }

    // Add a new candidate (can only be done during the registration phase)
    function addCandidate(string memory _name) public onlyAdmin inState(ElectionState.Registration) {
        candidates.push(Candidate({
            id: candidates.length,
            name: _name,
            voteCount: 0
        }));
    }

    // Register a voter (only admin can do this during registration)
    function registerVoter(address _voter) public onlyAdmin inState(ElectionState.Registration) {
        voters[_voter].isRegistered = true;
    }

    // Start the voting phase (only after at least one candidate is added)
    function startVoting() public onlyAdmin inState(ElectionState.Registration) {
        require(candidates.length > 0, "No candidates added");
        currentState = ElectionState.Voting;
    }

    // Allow only registered voters to vote for a candidate
    function vote(uint _candidateId) public inState(ElectionState.Voting) {
        Voter storage sender = voters[msg.sender];
        require(sender.isRegistered, "You are not registered to vote");
        require(!sender.hasVoted, "You have already voted");
        require(_candidateId < candidates.length, "Invalid candidate ID");

        sender.hasVoted = true;
        sender.votedCandidateId = _candidateId;
        candidates[_candidateId].voteCount++;
    }

    // End the voting phase (only admin)
    function endVoting() public onlyAdmin inState(ElectionState.Voting) {
        currentState = ElectionState.Ended;
    }

    // Return the name and vote count of the candidate who won
    function getWinner() public view inState(ElectionState.Ended) returns (string memory winnerName, uint voteCount) {
        uint highestVotes = 0;
        uint winnerIndex = 0;

        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].voteCount > highestVotes) {
                highestVotes = candidates[i].voteCount;
                winnerIndex = i;
            }
        }

        winnerName = candidates[winnerIndex].name;
        voteCount = candidates[winnerIndex].voteCount;
    }

    // Return number of candidates
    function getCandidateCount() public view returns (uint) {
        return candidates.length;
    }

    // Return a specific candidate's name and vote count
    function getCandidate(uint _index) public view returns (string memory, uint) {
        require(_index < candidates.length, "Invalid index");
        Candidate memory c = candidates[_index];
        return (c.name, c.voteCount);
    }
}
