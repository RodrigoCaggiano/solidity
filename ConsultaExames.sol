pragma solidity 0.8.9;

contract ConsultaExames {


    
    string public NomePaciente; 
    string public DataSolicitacao;
    string public NomeConvenio;
    uint public CodigoCarteiraPlano;
    uint public CpfPaciente;
    
    
    uint public CodigoExame;
    string public NomeExame;
    uint public ValorExame;
    bool public TemConvenio;



constructor (
    
    string memory _NomePaciente,
    string memory _DataSolicitacao,
    string memory _NomeConvenio,
    uint _CodigoCarteiraPlano,
    uint _CpfPaciente,
    
    uint _CodigoExame,
    string memory _NomeExame,
    uint _ValorExame

    )
    
    {
    NomePaciente = _NomePaciente;
    DataSolicitacao = _DataSolicitacao;
    NomeConvenio = _NomeConvenio;
    CodigoCarteiraPlano = _CodigoCarteiraPlano;
    CpfPaciente = _CpfPaciente;
    CodigoExame = _CodigoExame;
    NomeExame = _NomeExame;
    ValorExame = _ValorExame;


    }
    


function usurioTemConvenio(bool _TemConvenio) public returns (uint) {
    
    
   TemConvenio = _TemConvenio; 
 
    
    if  (TemConvenio = true) {  
        ValorExame = 0;
        }
        
    else {
        
        ValorExame = ValorExame;
        
    }    
    return (ValorExame);
    
    }    

function ApresentaAConta() public view returns (uint, string memory) {
    
    return (ValorExame, "Voce nos deve");
    
    }    


    
}

