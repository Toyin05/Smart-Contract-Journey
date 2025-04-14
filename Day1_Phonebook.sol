// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/// This is a Simple On-Chain PhoneBook
/// @notice This contract allows users to store and retrieve phone numbers.

contract PhoneBook {
    // Mapping an address to its phone number
    mapping(address => string) private phoneNumbers;

    /// @notice Set the caller's phone number
    /// @param _number This contains the phone number to store
    function setPhoneNumber(string calldata _number) public {
        phoneNumbers[msg.sender] = _number;
    }

    /// @notice Retrieve the phone number of any address
    /// @param _user The address to look up
    /// @return The phone number associated with the address
    function getPhoneNumber(address _user) public view returns (string memory) {
        return phoneNumbers[_user];
    }
}
