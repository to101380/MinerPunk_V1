// SPDX-License-Identifier: MIT
// ERC721A Contracts v3.3.0
// Creator: Chiru Labs

pragma solidity ^0.8.4;



/**
 * @dev Interface of an ERC721A compliant contract.
 */
interface mineIF  {   
    function blockStatus (uint256 _BlockNumber)external view returns (uint256);
    function mineInfo(address user, uint256 number) external view  returns (uint256);  
    function tokenIDPower (uint256 tokenId)external view returns(uint256);  
    function totalPower() external view returns (uint256);
    function MineStatus(address user)external view returns(uint256); 
}