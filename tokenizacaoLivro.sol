// SPDX-License-Identifier: MIT

 pragma solidity 0.8.9;
 
 
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


 contract VendaNFTLivro is ERC721URIStorage
    {
        
        using Counters for Counters.Counter;
        Counters.Counter private _tokenIds;
        string NomedoLivro;
        string Edicao;
        address dono;
    //    address estado;
        address comprador;

        
        struct lote
        {
        uint numeromatricula;
        uint numerocasa;
        uint valordolote;
        uint areaprivativa;
        address proprietario;
        bool disponivel;
        bool negociavel;
        }
        
        mapping (uint => lote) public loteamento;
        mapping (uint => bool) public numerodacasa;
        
        constructor 
        (
            string memory _NomedoLivro, 
            string memory _Edicao,
            string memory _symbolNft

      //      address _estado
        )
        
        ERC721(_NomedoLivro, _symbolNft)
        {
               NomedoLivro = _NomedoLivro;
               Edicao = _Edicao;
    //           estado = _estado;
               dono = msg.sender;
        }    
        
        function criarlote
        (
            uint _numeromatricula,
            uint _numerocasa,
            uint _valordolote,
            uint _areaprivativa,
            address _primeiroproprietario,
            bool _diponivel,
            bool _negociavel
    
            
        ) public 
        {
            require(msg.sender == dono, "apenas o incorporador pode criar um lote");
            require(loteamento[_numeromatricula].numeromatricula == 0, "matricula registrada");
            require(numerodacasa[_numerocasa] == false, "casa ja existe");
            require(_valordolote > 0, "favor inserir um valor diferente de zero");
            loteamento[_numeromatricula]= lote( _numeromatricula, _numerocasa, _valordolote, _areaprivativa, _primeiroproprietario, _diponivel, _negociavel);
            
        _mint(_primeiroproprietario, _numeromatricula);
        _setTokenURI(_numeromatricula, "teste");
        }
        
        
        
       function ComprarLivro(uint _numeromatricula )  public payable returns (address , string memory) {
        require(loteamento[_numeromatricula].disponivel == true, "O imovel deve estar disponivel ");
        require(loteamento[_numeromatricula].negociavel == true, "O imovel deve estar negociavel");
        require(msg.value == loteamento[_numeromatricula].valordolote, "O Valor do lote esta errado");
        require (msg.sender != loteamento[_numeromatricula].proprietario, "o atual dono nao pode comprar o imovel");
        payable(loteamento[_numeromatricula].proprietario).transfer(msg.value);
        _transfer(loteamento[_numeromatricula].proprietario, msg.sender, _numeromatricula);
        
        loteamento[_numeromatricula].proprietario = msg.sender;
        loteamento[_numeromatricula].negociavel = false;
        
        
        return(loteamento[_numeromatricula].proprietario, "O Novo proprietrio e a carteira");


      }
       
       
        function AlterarSatusLivro(uint _numeromatricula , uint _valordolote, bool _diponivel )  public  returns (uint, string memory) {
        
        require(msg.sender == loteamento[_numeromatricula].proprietario, "o status do imovel so pode ser alterado pelo proprietario do imovel");
        require(_valordolote > 0, "O Valor do lote nao pode ser 0");
        loteamento[_numeromatricula].valordolote = _valordolote;
        loteamento[_numeromatricula].disponivel = _diponivel;

        return(loteamento[_numeromatricula].valordolote, "esse e o novo valor do lote");
      }
       


        function DoarLivro (uint _numeromatricula, address _novoProprietario) public returns (address, string memory) {
            
            
            require (msg.sender == loteamento[_numeromatricula].proprietario , "apenas o proprietario pode fazer a transferencia");
            require (loteamento[_numeromatricula].disponivel, "o imovel deve estar disponivel" );
            _transfer(msg.sender, _novoProprietario, _numeromatricula);
            loteamento[_numeromatricula].proprietario = _novoProprietario;
             return ( loteamento[_numeromatricula].proprietario , " voce doou o imovel para a carteira");
            
            
        }
      
        
        
    }
