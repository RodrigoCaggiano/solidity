
// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;
 
contract MeuContrato {
    
    address public vendedor;
    uint public preco;
    uint internal balance;
    address Sacador;
    uint ValorDoSaque;
    
    constructor(uint _preco) {
     //   vendedor = msg.sender;
        preco = _preco;
        // preco = _preco * 1 ether;
    }
    
    function pagar() public payable {
      //  require(msg.value == preco, "Valor incorreto");
      //  payable(balance).transfer(msg.value);
    }
    
    function depositar() public payable {
    //    require(msg.value == preco, "Valor incorreto");
        balance = balance + msg.value;
    }
    
    function sacar(address _Sacador, uint _valordosaque) public  {
        Sacador = _Sacador;
        ValorDoSaque = _valordosaque;
        payable(_Sacador).transfer(ValorDoSaque);
        balance = balance - ValorDoSaque;
     //   return (value , _Sacador);
    }
    
    function verSaldo() public view returns(uint){
        return(balance);
    }
    
}
