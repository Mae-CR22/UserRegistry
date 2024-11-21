// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract UserRegistry {
    struct User {
        string name;
        uint balance;
    }

    mapping(address => User) public users;
    address[] public userAddresses;

    function registerUser(string memory _name, uint _initialBalance) public {
        // Lógica para registrar un usuario
    }

    function getAllUsers() public view returns (address[] memory) {
        return userAddresses;
    }
}
