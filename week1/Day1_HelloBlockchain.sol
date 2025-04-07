// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract HelloBlockchain {
    string public message;

    constructor() {
        message = "Hello, Blockchain. I'm coming for you";
    }

    function updateMessage(string memory _newMessage) public {
        message = _newMessage;
    }
}
