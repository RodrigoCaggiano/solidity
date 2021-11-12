// SPDX-License-Identifier: MIT pragma solidity 0.8.9; contract Registro {​​​​​

    mapping(uint => string) registroDeNomes;

    function registrarNome(uint _chave, string memory _valor) public {​​​​​

        registroDeNomes[_chave] = _valor;       

    }​​​​​

    function verRegistro(uint _chave) public view returns(string memory) {​​​​​

        return registroDeNomes[_chave];

    }​​​​​

    function editarNome(uint _chave, string memory _novoValor) public {​​​​​

        registroDeNomes[_chave] = _novoValor;

    }​​​​​

    function deletarNome(uint _chave) public {​​​​​

        registroDeNomes[_chave] = "";

    }​​​​​

}​​​​​ 

