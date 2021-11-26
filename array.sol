//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;


contract CarteiraVacinas{

struct Vacinas {
uint index;
string tipo;
uint data;

}
Vacinas[] public ArrayDeVacinas;

function AdicionarVacina(string memory _tipo) public {
ArrayDeVacinas.push(Vacinas(ArrayDeVacinas.length, _tipo, block.timestamp));
}

function quantidadeTotalVacinas () public view returns (uint) {
return (ArrayDeVacinas.length);
}

}
