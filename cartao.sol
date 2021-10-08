pragma solidity 0.8.9;

contract CartaoDeVacinacao{
    //Autor: Rodrigo Caggiano 
    
    string constant public NomeVacinado = "Rodrigo Caggiano"; 
    string public Unidade = "Vila mariana";
    uint public CNES = 112; 
    string public data = "12/06/2021";
    uint private lote01 = 10;
    string constant private NomeFabricante = "Janssen"; 
    uint public CPF = 21916279864; 
    string  public NomeVacinador = "Jose da Silva";
    address private wallet = 0x20Ea0169A674d78d63Fd72748382cFeA01a17aF6;
    bool public imunizado = false;
    
  
}
