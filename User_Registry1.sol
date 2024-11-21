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
        // Verificar que el usuario no esté registrado
        require(bytes(users[msg.sender].name).length == 0, "Usuario ya registrado");

        // Registrar al usuario
        users[msg.sender] = User(_name, _initialBalance);

        // Añadir la dirección al array
        userAddresses.push(msg.sender);
    }

    function getAllUsers() public view returns (address[] memory) {
        return userAddresses;
    }
}
