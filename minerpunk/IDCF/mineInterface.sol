// SPDX-License-Identifier: MIT
// ERC721A Contracts v3.3.0
// Creator: Chiru Labs

pragma solidity ^0.8.4;



/**
 * @dev Interface of an ERC721A compliant contract.
 */
interface mine  {   

    function MineStatus(address user)external view returns(uint256);    
    function tokenIDPower (uint256 tokenId)external view returns(uint256);  
    function blockStatus (uint256 _BlockNumber)external view returns (uint256);
      
}