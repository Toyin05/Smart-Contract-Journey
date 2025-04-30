// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importing OpenZeppelin's ERC20 implementation
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

// Creating a custom ERC20 token contract named MyToken
contract MyToken is ERC20, Ownable {
    // Constructor runs only once when the contract is deployed
    constructor() ERC20("MyToken", "MTK") {
        // Mint initial supply to the deployer (msg.sender)
        _mint(msg.sender, 1000 * 10 ** decimals());
    }

    // Mint function allows the owner to mint more tokens to a specific address
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
