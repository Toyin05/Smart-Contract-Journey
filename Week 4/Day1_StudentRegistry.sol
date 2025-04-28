// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title Student Registry
/// This contract allows the registration and retrieval of student details by the use of structs, mappings, and arrays.

contract StudentRegistry {

    // Struct to hold student details
    struct Student {
        string name;
        uint age;
        string course;
    }

    // Mapping from student address to their details
    mapping(address => Student) private studentDetails;

    // Array to store all student addresses
    address[] private studentAddresses;

    /// @notice Registers a new student
    /// @param _name The student's name
    /// @param _age The student's age
    /// @param _course The student's course of study
    function registerStudent(string memory _name, uint _age, string memory _course) public {
        // Ensure the student is not already registered
        require(bytes(studentDetails[msg.sender].name).length == 0, "Student already registered");

        // Create a new student struct and save it
        studentDetails[msg.sender] = Student(_name, _age, _course);

        // Add the student's address to the array
        studentAddresses.push(msg.sender);
    }

    /// @notice Retrieves the details of a student by address
    /// @param _studentAddress The address of the student
    /// @return name The student's name
    /// @return age The student's age
    /// @return course The student's course
    function getStudent(address _studentAddress) public view returns (string memory name, uint age, string memory course) {
        Student memory student = studentDetails[_studentAddress];
        return (student.name, student.age, student.course);
    }

    /// @notice Returns all registered student addresses
    /// @return Array of addresses of all registered students
    function getAllStudents() public view returns (address[] memory) {
        return studentAddresses;
    }
}
