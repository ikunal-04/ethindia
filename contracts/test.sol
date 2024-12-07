// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * WARNING: This contract contains several vulnerabilities and should never be used in production.
 * It is solely for educational purposes to demonstrate poor practices and common pitfalls in Solidity.
 */
contract VulnerableContract {
    mapping(address => uint256) public balances;

    // Accept Ether deposits with no access control or safeguards.
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    // **Vulnerability 1: Reentrancy**
    function withdraw(uint256 _amount) public {
        require(balances[msg.sender] >= _amount, "Insufficient balance");

        // Send funds to the caller before updating the balance.
        (bool sent, ) = msg.sender.call{value: _amount}("");
        require(sent, "Transfer failed");

        // Update balance after sending funds.
        balances[msg.sender] -= _amount;
    }

    // **Vulnerability 2: Overflow/Underflow (fixed in Solidity >=0.8.0, but bad practice for older versions)**
    function unsafeMath(uint256 _value) public pure returns (uint256) {
        return _value - 1; // No checks for underflow!
    }

    // **Vulnerability 3: Ownership Issues**
    address public owner;

    constructor() {
        owner = msg.sender; // Set the deployer as the owner.
    }

    function changeOwner(address _newOwner) public {
        // No checks to ensure only the current owner can change ownership.
        owner = _newOwner;
    }

    // **Vulnerability 4: Poor Randomness**
    function getRandomNumber() public view returns (uint256) {
        // Predictable randomness using block variables.
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.difficulty, msg.sender)));
    }

    // **Vulnerability 5: External Contract Interaction**
    function callExternalContract(address _contract) public {
        // Blindly calls an external contract with no checks.
        (bool success, ) = _contract.call(abi.encodeWithSignature("externalFunction()"));
        require(success, "External call failed");
    }

    // **Vulnerability 6: Unrestricted Ether Withdrawals**
    function withdrawAll() public {
        // Anyone can withdraw all contract funds.
        payable(msg.sender).transfer(address(this).balance);
    }

    // Fallback function to accept Ether with no logging or control.
    fallback() external payable {}
    receive() external payable {}
}
