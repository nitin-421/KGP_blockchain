#!/bin/bash
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FundMe {
    mapping(address => bool) public funders; // Mapping to store unique funders
    address[] public uniqueFunders; // Array to store unique funder addresses

    // Function to contribute funds
    function contribute() public payable {
        require(msg.value > 0, "Invalid contribution amount"); // Require a non-zero contribution

        // Check if the sender is a new funder
        if (!funders[msg.sender]) {
            funders[msg.sender] = true; // Add the funder to the mapping
            uniqueFunders.push(msg.sender); // Add the funder to the uniqueFunders array
        }

       }   // Rest of the contribution logic...
    

    // Function to get the list of funders
    function getFunders() public view returns (address[] memory) {
        return uniqueFunders;
    }

    // Rest of the contract...