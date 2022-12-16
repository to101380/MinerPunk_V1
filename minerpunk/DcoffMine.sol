// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import '@openzeppelin/contracts/token/ERC20/IERC20.sol';
import '@openzeppelin/contracts/utils/math/SafeMath.sol';
import './IDCF/mineInterface.sol';





contract DcoffMine  {
  using SafeMath for uint;  
  mine DCFmine = mine(0xB59Ec56C2993cCb4E274E273d66699B17466D2b5);
  IERC20 dcoff =  IERC20(0x78Bdb6eF9bC1D302c7d388dC40b38092745c8F2d);
  

  
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