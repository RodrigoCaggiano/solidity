pragma solidity 0.8.9;

contract CompraVenda {
    
    string public NomeComprador; 
    string public NomeVendedor;
    uint public NumeroMatricula;
    string public cartorio;
    string public DataVencimento;
    bool public Quitado = false; 
    uint public ValorTotaldoContrato = 20000;
    uint public ValorDaEntrada;
    uint public ValorQuitado;
    uint public ValorDaParcela;

     
    
    function  defineNomeComprador(string memory _NomeComprador) public {
        
     NomeComprador = _NomeComprador;
        
    }
    

    function PagamentoEntrada (uint _valorDaEntrada ) public returns (uint, string memory) {
        
        ValorDaEntrada = _valorDaEntrada;
        ValorTotaldoContrato = (ValorTotaldoContrato - ValorDaEntrada);
        return (ValorTotaldoContrato, "valor do contrato em aberto");
        
        
    }

    
}
