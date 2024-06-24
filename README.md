# ExampleContract Smart Contract

The ExampleContract is a Solidity smart contract that demonstrates the use of `require`, `assert`, and `revert` statements for error handling. This contract allows for setting an owner, storing a positive integer value, and resetting the value with proper access control.

## Description

- **Owner**: Address of the contract owner.
- **Value**: A positive integer value stored in the contract.

### Functions:

- **setOwner**: Sets the owner of the contract. This can only be done once.
- **setValue**: Sets a positive integer value. Only the owner can call this function.
- **checkValue**: Checks if the stored value is greater than zero.
- **resetValue**: Resets the stored value to zero. Only the owner can call this function.

## Getting Started

### Executing the Program

To run this program, you can use Remix, an online Solidity IDE. Follow the steps below:

1. **Open Remix**: Go to [Remix](https://remix.ethereum.org/).
2. **Create a New File**: 
   - Click on the "+" icon in the left-hand sidebar.
   - Name the file `ExampleContract.sol`.
3. **Copy and Paste the Code**: Copy the following code into `ExampleContract.sol`:

    ```solidity
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.0;

    contract ExampleContract {
        address public owner;
        uint256 public value;

        // Function to set the owner, only callable once
        function setOwner(address _owner) public {
            require(owner == address(0), "Owner is already set");
            owner = _owner;
        }

        // Function to set a value with require
        function setValue(uint256 _value) public {
            require(msg.sender == owner, "Caller is not the owner");
            require(_value > 0, "Value must be positive");
            value = _value;
        }

        // Function to check a condition with assert
        function checkValue() public view returns (string memory) {
            assert(value > 0);
            return "Value is greater than zero";
        }

        // Function to demonstrate revert
        function resetValue() public {
            if (msg.sender != owner) {
                revert("Caller is not the owner");
            }
            value = 0;
        }
    }
    ```

4. **Compile the Code**:
   - Click on the "Solidity Compiler" tab in the left-hand sidebar.
   - Make sure the "Compiler" option is set to `0.8.x` (or another compatible version).
   - Click on the "Compile ExampleContract.sol" button.

5. **Deploy the Contract**:
   - Click on the "Deploy & Run Transactions" tab in the left-hand sidebar.
   - Select the "ExampleContract" contract from the dropdown menu.
   - Click on the "Deploy" button.

### Interacting with the Contract

1. **Set the Owner**:
   - Call the `setOwner` function with an Ethereum address.

2. **Set a Value**:
   - Call the `setValue` function with a positive integer using the same address that was set as the owner.

3. **Check the Value**:
   - Call `checkValue`. It should return "Value is greater than zero" if the value is greater than zero.

4. **Reset the Value**:
   - Call `resetValue` to reset the value to zero using the owner address.

## Authors

This smart contract was created by Ankit Vashisth.

## License

This project is licensed under the MIT License - see the LICENSE.md file for details.
