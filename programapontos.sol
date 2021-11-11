
// SPDX-License-Identifier: MIT

pragma solidity 0.8.9;
 
contract MeuContrato {
    
    address public vendedor;
    uint internal balance;
    address Sacador;
    uint ValorDoSaque;
    address public depositario;
    uint public ValorDeposito;
    uint public QuantidadePontos;
    string public NomePrograma;
    
    
    event deposito(address depositario, uint ValorDeposito);
    event saque(address _Sacador, uint _valordosaque);

    
    constructor(string memory _NomePrograma) {
     //   vendedor = msg.sender;
        NomePrograma = _NomePrograma;
        // preco = _preco * 1 ether;
    }
    
    function AplicaPontuacao() internal returns(uint) {
      //require(msg.value == preco, "Valor incorreto");
      //payable(balance).transfer(msg.value);
     QuantidadePontos =  (ValorDeposito)/10;
     return (QuantidadePontos);
    }
    
    function depositar() public payable {
    //    require(msg.value == preco, "Valor incorreto");
    depositario = msg.sender;
    ValorDeposito = msg.value;
    balance = balance + msg.value;
    AplicaPontuacao();
    emit deposito(depositario, ValorDeposito); 
    }
    
    function sacar(address _Sacador, uint _valordosaque) public  {
        Sacador = _Sacador;
        ValorDoSaque = _valordosaque;
        payable(_Sacador).transfer(ValorDoSaque);
        balance = balance - ValorDoSaque;
        emit saque(Sacador, ValorDoSaque); 

     //   return (value , _Sacador);
    }
    
    function verSaldo() public view returns(uint){
        return(balance);
    }
    
}
