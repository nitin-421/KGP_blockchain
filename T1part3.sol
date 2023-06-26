// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FundMe {
    address public owner;
    mapping(address => bool) public funders;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Invalid new owner address");
        owner = newOwner;
    }

    function contribute() public payable {
        require(msg.value > 0, "Invalid contribution amount");

        if (!funders[msg.sender]) {
            funders[msg.sender] = true;
        }

        // Rest of the contribution logic...
    }

    // Rest of the contract...
}
