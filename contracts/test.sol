// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VulnerableContract {

    address public owner;
    uint public funds;

    mapping(address => uint) public balances;
    
    constructor() {
        owner = msg.sender;
        funds = 0;
    }

    // 1. Reentrancy vulnerability: The contract allows a withdrawal that could cause reentrancy.
    function deposit() public payable {
        require(msg.value > 0, "Deposit must be greater than 0");
        balances[msg.sender] += msg.value;
        funds += msg.value;
    }

    function withdraw(uint amount) public {
        require(balances[msg.sender] >= amount, "Insufficient balance");

        // Vulnerability: Reentrancy attack can occur here.
        payable(msg.sender).transfer(amount);

        balances[msg.sender] -= amount;
        funds -= amount;
    }

    // 2. Owner privilege vulnerability: The owner can withdraw all funds from the contract.
    function withdrawAll() public {
        require(msg.sender == owner, "Only the owner can withdraw all funds");
        payable(owner).transfer(funds);
        funds = 0;
    }

    // 3. Integer overflow/underflow vulnerability (unchecked math)
    function increaseFunds(uint amount) public {
        // Vulnerability: If amount is large enough, overflow could occur.
        funds += amount;
    }

    // 4. Lack of access control: Anyone can change the owner of the contract.
    function changeOwner(address newOwner) public {
        owner = newOwner;
    }

    // 5. Insecure random number generation
    function generateRandomNumber() public view returns (uint) {
        // Vulnerability: `block.timestamp` is predictable and can be manipulated by miners.
        return uint(keccak256(abi.encodePacked(block.timestamp, block.difficulty))) % 100;
    }

    // 6. Denial of Service (DOS) vulnerability: The contract can be blocked by a single transaction.
    function blockableFunction() public {
        require(funds > 0, "No funds available");
        // Vulnerability: The function can be blocked by sending 0 funds to the contract
        funds = 0;
    }

    // 7. Missing input validation
    function unsafeSet(uint _value) public {
        // Vulnerability: No checks on the value, anyone can call it and set arbitrary values
        funds = _value;
    }
}
