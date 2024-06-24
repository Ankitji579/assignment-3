// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract ExampleContract {
    address public owner;
    uint256 public value;

    // Function to set the owner, only callable once
    function setOwner(address _owner) public {
        // Require that the owner is not already set
        require(owner == address(0), "Owner is already set");

        owner = _owner;
    }

    // Function to set a value with require
    function setValue(uint256 _value) public {
        // Require that the caller is the owner
        require(msg.sender == owner, "Caller is not the owner");

        // Require that the value is positive
        require(_value > 0, "Value must be positive");

        value = _value;
    }

    // Function to check a condition with assert
    function checkValue() public view returns (string memory) {
        // Assert that the value is greater than zero
        assert(value > 0);

        return "Value is greater than zero";
    }

    // Function to demonstrate revert
    function resetValue() public {
        // Revert the transaction if the caller is not the owner
        if (msg.sender != owner) {
            revert("Caller is not the owner");
        }

        value = 0;
    }
}
