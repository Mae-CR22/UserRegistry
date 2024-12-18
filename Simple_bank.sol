// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract SimpleBank {
    //Variales de estado
    mapping(address => uint256) public balances; //balances de cada usuario
    address public owner; //direccion del propietario del contrato

//El constructor se ejecuta al desplegar el contrato
constructor() {
    owner = msg.sender; //define al propietario del contrato
}

// Modificador para restrimgir el acceso solo al propietario
modifier onlyOwner() {
require(msg.sender == owner, "no estas autorizado");
_;
}

  //Funcion para depositar ETH 

  function deposit() public payable {
    require(msg.value > 0,"debes enviar ETH");
    balances[msg.sender] += msg.value; //Incrementa el balance del usuario
} 
// Funcion para consultar el balance del usuario
function getBalance() public view returns (uint256) {
    return balances[msg.sender]; //Devuelve el balance del usuario que llama
}
//Funcion para retirar ETH del Balance.
function withdraw(uint256 _amount) public {
  require(balances[msg.sender] >= _amount, "No tienes sufiectes fondos");
balances[msg.sender] -= _amount; //Reduce el balance del usuario.
payable(msg.sender).transfer(_amount); //EnVia ETH al usuario.
}
// Funcion para consultar el balance total del contrato (solo propietario).
function getContractBalance()public view onlyOwner returns (uint256) {
    return address(this).balance; //Devuelve el balance total del contrato.
    }

    //funcion para transferir ETH de un ususario a otro usuario registrado.
    function transfer(address _to, uint256 _amount) public {
    require(_to != address(0),"Direccion invalida"); //Asegura que la direccion no sea cero.
    require(balances[msg.sender] >= _amount,"fondos insuficientes"); //Asegura que el remitente tenga fondos suficientes

balances[msg.sender] -= _amount; // Reduce el balance del remitente.
balances[_to] += _amount; //suma al balance del destinatario.
    }
}