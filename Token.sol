// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract Token {

    // Public Token Variables 
    string public tokenName;
    string public tokenSymbol;
    uint public totalSupply;

    // Map to track balance of everyone
    mapping(address => uint) public balances;

    // Constructor to initialize the contract with token details
    constructor(string memory name, string memory symbol, uint initialSupply) {
        tokenName = name;
        tokenSymbol = symbol;
        totalSupply = initialSupply;
        balances[msg.sender] = initialSupply;
    }

    // Mint Function to make more tokens
    function mint(address receiver, uint amount) public {
        // Give Tokens To the Reciver
        totalSupply += amount;
        balances[receiver] += amount;
    }

    // Burn Function to delete tokens
    function burn(address sender, uint amount) public {
        // Checking if the address has those coins
        require(balances[sender] >= amount, "Not Enough Tokens");
        // Destroying if the condition is true
        totalSupply -= amount;
        balances[sender] -= amount;
    }
}


