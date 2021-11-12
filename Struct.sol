// SPDX-License-Identifier: MIT
 
pragma solidity 0.8.9;
 
contract MeuContrato {

    struct Registro {
        uint matricula;
        string endereco;
        address proprietario;
        bool disponivel;
    }

    mapping(uint => Registro) public listaDeRegistros;

    function criarRegistro(
        uint _matricula,
        string memory _endereco,
        address _proprietario,
        bool _disponivel
        ) public 
    {
        listaDeRegistros[_matricula] = Registro(_matricula, _endereco, _proprietario, _disponivel);        
    }

    function editarProprietario(uint _matricula, address _novoProprietario) public {
        listaDeRegistros[_matricula].proprietario = _novoProprietario;
    }

    function editarEnderecoEDisponibilidade(uint _matricula, string memory _novoEndereco, bool _disponibilidade) public {
        listaDeRegistros[_matricula] = Registro(_matricula, _novoEndereco, listaDeRegistros[_matricula].proprietario, _disponibilidade);
    }

}
