// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EasyBank {
    mapping(address => uint256) public Bank;

    function getBank() public view returns (uint256) {
        return Bank[msg.sender];
    }

    function deposit() public payable {
        Bank[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        require(Bank[msg.sender] >= amount, "Insufficient money to withdraw!");

        Bank[msg.sender] -= amount;

        (bool success, ) = msg.sender.call{value: amount}("");
        require(success, "Withdraw failed!");
    }
}
// Wanchai Chiangfung