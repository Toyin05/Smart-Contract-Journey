// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Enhanced Student Registry
/// This contract adds access control, event logging, and custom errors to the base contract

contract StudentRegistryEnhanced {
    
    // Struct to hold student details
    struct Student {
        string name;
        uint age;
        string course;
    }

    // Mapping from student address to their details
    mapping(address => Student) private studentDetails;

    // Array to store all registered student addresses
    address[] private studentAddresses;

    // Owner of the contract (admin)
    address private owner;

    // Custom errors for better gas efficiency
    error AlreadyRegistered();
    error NotRegistered();
    error NotOwner();

    // Events to log major actions
    event StudentRegistered(address indexed studentAddress, string name);
    event StudentRemoved(address indexed studentAddress);

    // Modifier to restrict access to only the contract owner
    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    // Constructor sets the deployer as the owner
    constructor() {
        owner = msg.sender;
    }

    /// @notice Registers a new student
    /// @param _name The student's name
    /// @param _age The student's age
    /// @param _course The student's course of study
    function registerStudent(string memory _name, uint _age, string memory _course) public {
        // Check if student is already registered using custom error
        if (bytes(studentDetails[msg.sender].name).length != 0) revert AlreadyRegistered();

        // Save the student details
        studentDetails[msg.sender] = Student(_name, _age, _course);

        // Add address to the list
        studentAddresses.push(msg.sender);

        // Emit registration event
        emit StudentRegistered(msg.sender, _name);
    }

    /// @notice Removes a student (onlyOwner)
    /// @param _studentAddress The student's wallet address
    function removeStudent(address _studentAddress) public onlyOwner {
        // Ensure the student exists
        if (bytes(studentDetails[_studentAddress].name).length == 0) revert NotRegistered();

        // Delete the student's details
        delete studentDetails[_studentAddress];

        // Remove the address from the array (not optimized)
        for (uint i = 0; i < studentAddresses.length; i++) {
            if (studentAddresses[i] == _studentAddress) {
                studentAddresses[i] = studentAddresses[studentAddresses.length - 1];
                studentAddresses.pop();
                break;
            }
        }

        // Emit removal event
        emit StudentRemoved(_studentAddress);
    }

    /// @notice Retrieves student details
    /// @param _studentAddress The address to query
    /// @return name, age, course
    function getStudent(address _studentAddress) public view returns (string memory, uint, string memory) {
        Student memory student = studentDetails[_studentAddress];
        return (student.name, student.age, student.course);
    }

    /// @notice Returns all student addresses
    function getAllStudents() public view returns (address[] memory) {
        return studentAddresses;
    }

    /// @notice Returns the owner of the contract
    function getOwner() public view returns (address) {
        return owner;
    }
}
