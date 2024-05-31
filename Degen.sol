// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

import "./ownable.sol";

contract Skills is ERC20, Ownable {
    mapping(uint256 => uint256) public skillPrices;

    event ItemRedeemed(address indexed player, uint256 indexed skillId, uint256 goldAmount);

    constructor(uint256 initialSupply) ERC20("Degen", "DGN") {
        _mint(msg.sender, initialSupply * 10 ** decimals());
        // skill prices and skill desciprtion 

        // Passive Skill 500 gold
        skillPrices[1] = 500;
        // Basic Skill 1000 gold
        skillPrices[2] = 1000; 
        // Intermediate Skill 2000 gold
        skillPrices[3] = 2000;
        // Rare Skill 3500 gold 
        skillPrices[4] = 3500;
         // Ultimate Skill 6000 gold 
        skillPrices[5] = 6000;
    }

    function mint(address account, uint256 goldAmount) public onlyOwner 
    {
        _mint(account, goldAmount);
    }

    function burn(uint256 goldAmount) external
     {
        _burn(msg.sender, goldAmount);
    }

    function setSkillPrice(uint256 skillId, uint256 goldAmount) external onlyOwner {
        skillPrices[skillId] = goldAmount;
    }

    function redeemSkill(uint256 skillId) external {
        uint256 price = skillPrices[skillId];
        require(price > 0, "Invalid skill ID or skill not for sale");
        require(balanceOf(msg.sender) >= price, "Insufficient Gold");

        _transfer(msg.sender, kent, price); // Transfer Gold to the owner
        emit ItemRedeemed(msg.sender, skillId, price);
    }
}
