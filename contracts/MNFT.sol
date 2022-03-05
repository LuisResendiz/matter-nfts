// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "./base64.sol";
import "./MNFTDNA.sol";


/// @title MNFT-NFT ERC721 Interface 
/// @author Luis Resendiz @mattermind.mx
/// @notice A simple interface to deploy ERC721 compliant nfts. Based in PlatziPunks by Platzi.
/// @dev Minting only for self address with selfMint

contract MNFT is ERC721, ERC721Enumerable, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;
    uint256 public maxSupply;
    constructor(uint256 _maxSupply) ERC721("Matterblock","Mttr") {
        maxSupply = _maxSupply;
        }

    function tokenURI(uint256 tokenId) public view override returns (string memory) {
        require(_exists(tokenId),"ERC721 Token metadata: URI nonexistent");
        
        string memory jsonURI = Base64.encode(
         abi.encodePacked(
             '{ "name": "Matterblock #',
             tokenId,
             '", "description": "Matterblock is a ", "image": "',
             "//TODO CALCULATE ImgURL",
             '"}'

         )
        );

        return string(abi.encodePacked("data:application/json;base64,", jsonURI));

    }

    function selfMint() public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        require(tokenId<maxSupply,"No more Matterblocks left.");
        _tokenIdCounter.increment();
        _safeMint(msg.sender, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._beforeTokenTransfer(from, to, tokenId);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }


}