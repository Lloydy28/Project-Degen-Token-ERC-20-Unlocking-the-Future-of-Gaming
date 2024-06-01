### Project: Degen Token (ERC-20): Unlocking the Future of Gaming
Are you up for a challenge that will put your skills to the test? Degen Gaming 🎮, a renowned game studio, has approached you to create a unique token that can reward players and take their game to the next level. You have been tasked with creating a token that can be earned by players in their game and then exchanged for rewards in their in-game store. A smart step towards increasing player loyalty and retention 🧠

To support their ambitious plans, Degen Gaming has selected the Avalanche blockchain, a leading blockchain platform for web3 gaming projects, to create a fast and low-fee token. With these tokens, players can not only purchase items in the store, but also trade them with other players, providing endless possibilities for growth📈

Are you ready to join forces with Degen Gaming and help turn their vision into a reality? The gaming world is counting on you to take it to the next level. Will you rise to the challenge 💪, or will it be game over ☠️ for you?

### Getting Started
Executing program
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";

import "./ownable.sol";

contract Skills is ERC20, Ownable
{
    mapping(uint256 => uint256) public skillPrices;
    mapping(address => mapping(uint256 => bool)) public redeemedSkills;
    mapping(address => mapping(uint256 => bool)) public skillOwnership; // Track skill ownership

    event ItemRedeemed(address indexed player, uint256 indexed skillId, uint256 goldAmount);

    event SkillDelivered(address indexed player, uint256 indexed skillId);

    constructor(uint256 initialSupply) ERC20("Degen", "DGN") 
    {
        _mint(msg.sender, initialSupply * 10 ** decimals());
        // skill prices and skill description 
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

    function mint(address account, uint256 goldAmount) public onlyOwner {
        _mint(account, goldAmount);
    }

    function burn(uint256 goldAmount) external {
        _burn(msg.sender, goldAmount);
    }

    function setSkillPrice(uint256 skillId, uint256 goldAmount) external onlyOwner {
        skillPrices[skillId] = goldAmount;
    }

    function redeemSkill(uint256 skillId) external {
        uint256 price = skillPrices[skillId];
        require(price > 0, "Invalid skill ID or skill not for sale");
        require(balanceOf(msg.sender) >= price, "Insufficient Gold");
        require(!redeemedSkills[msg.sender][skillId], "Skill already redeemed");

        _transfer(msg.sender, kent, price); // Transfer Gold to the owner
        redeemedSkills[msg.sender][skillId] = true;
        skillOwnership[msg.sender][skillId] = true; // Mark skill as owned by the player

        emit ItemRedeemed(msg.sender, skillId, price);
        emit SkillDelivered(msg.sender, skillId);
    }

    function checkSkillOwnership(address player, uint256 skillId) external view returns (bool) {
        return skillOwnership[player][skillId];
    }
}

        



### Authors
Natinaol Teacher's College
Tenefrancia, John Loyd B.
8215176@ntc.edu.ph
