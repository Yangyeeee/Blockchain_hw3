pragma solidity ^0.4.24;


import "../node_modules/openzeppelin-solidity/contracts/crowdsale/Crowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "../node_modules/openzeppelin-solidity/contracts/crowdsale/validation/CappedCrowdsale.sol";

contract ExampleTokenCrowdsale is Crowdsale, MintedCrowdsale, CappedCrowdsale{

	//minimum investor Contribution - 5 ether 
	//maximum investor Contribution - 50 ether
	uint256 public investorMinCap = 5000000000000000000;
	uint256 public investorHardCap = 50000000000000000000;
        uint256 totalSpent = 0;

	mapping(address => uint256) public contributions;

	constructor(uint256 _rate,
	  address _wallet,
	  ERC20 _token,
	  uint256 _cap)
	Crowdsale(_rate, _wallet, _token)
	CappedCrowdsale(_cap)
	public{
	}

  function getTokensLeft() view public returns (uint256) {
    uint256 tokensLeft = cap - totalSpent;
    return tokensLeft;
  }
 
  function _preValidatePurchase(
    address _beneficiary,
    uint256 _weiAmount
  )
    internal
  {
    super._preValidatePurchase(_beneficiary, _weiAmount);
    uint256 _existingContribution = contributions[_beneficiary];
    uint256 _newContribution = _existingContribution.add(_weiAmount);
    require(_newContribution >= investorMinCap && _newContribution <= investorHardCap, "error:minimum contribution is 5 Ether");
    require(_existingContribution == 0, "error:1 purchase per account");
    totalSpent = totalSpent + _newContribution;
    contributions[_beneficiary] = _newContribution;     
  }
   
}
