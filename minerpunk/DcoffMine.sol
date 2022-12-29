// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import './IDCF/mineInterface.sol';





contract DcoffMine  {
  using SafeMath for uint;  
  mineIF DCFmine = mineIF(0x90544049d50c012caF6F5F1C10344b7A9c05A064);
  IERC20 dcoff =  IERC20(0xC74Ab3FF349cE64a349854BcD5dc2D542371350F);
  

  
  address private owner;

  

  mapping(address => uint256 )private ScoreWithdrawn;

  constructor(){   
    owner = msg.sender;    
  }



  function viewReward(address user)public view returns(uint256){
      uint256 dcf_amount = DCFmine.MineStatus(user);
      dcf_amount = dcf_amount.sub(ScoreWithdrawn[user]);
      return dcf_amount;
  } 

  function Claim()external {
      uint claim_dcf = viewReward(msg.sender);
      dcoff.transfer(msg.sender,claim_dcf);
      ScoreWithdrawn[msg.sender] = ScoreWithdrawn[msg.sender].add(claim_dcf);
  } 


   
  

}