// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./ERC721A/ERC721A.sol";



contract minerpunk is ERC721A {
  using SafeMath for uint; 
 
  

  constructor(uint256 _price, uint256 openAmount)ERC721A("minerpunk", "minerpunk",6) {
    info[0][1] = _price;      
    info[0][4] = openAmount;   
    owner = msg.sender;    
  }

   address owner;  
  
 

   modifier onlyOwner() {
        require(owner == msg.sender, "Ownable: caller is not the owner");
        _;
    }

  
 
 
  mapping(uint256 => mapping(uint256 => uint256))private info;  
  // [0][1] mint price (wei)
  // [0][3] Sold
  // [0][4] open
  



 
  function mint(uint256 quantity) external payable {   
    require(info[0][3]<info[0][4]);
    require(info[0][3].add(quantity)<=info[0][4]);
    uint256 price = quantity.mul(info[0][1]);  
    require(msg.value >= price);            
    payable(owner).transfer(price);    
    _safeMint(msg.sender, quantity);
    info[0][3] = info[0][3].add(quantity);      
  }






  function setInfo(uint256 paramA, uint256 paramB, uint256 paramC)external onlyOwner{
    info[paramA][paramB]=paramC;
  }

  function ViewInfo(uint256 paramA, uint256 paramB)external view returns(uint256)  {
    return info[paramA][paramB];
  }



 
  





  

}