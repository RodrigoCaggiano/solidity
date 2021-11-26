//SPDX-License-Identifier: MIT
pragma solidity 0.8.9;

interface ISecret {
function segredo() external view returns (string memory);
}


contract Seraqueeisso {

 string public raidamensagem;

    ISecret public QualSegredo; //chama a interface 
        function VerSegredo() public returns (string memory) {
            QualSegredo = ISecret(0x6092c93dD90D05940b8DC2DCbec728152A5c245F);
            raidamensagem = QualSegredo.segredo();
        return (QualSegredo.segredo());
    }
}
