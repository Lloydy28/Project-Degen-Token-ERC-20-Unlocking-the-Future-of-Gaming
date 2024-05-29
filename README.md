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

contract Skills is ERC20, Ownable {
    mapping(uint256 => uint256) public skillPurchase;

    event ItemRedeemed(address indexed player, uint256 indexed skillId, uint256 Gold);

    constructor(uint256 initialSupply) ERC20("Degen", "DGN") 
    {
        _mint(msg.sender, initialSupply * 10 ** decimals());
        // skill 1: Passive Skill - Price: 500 Gold
        skillPurchase[1] = 500; 
        // skill 2: Basic Skill - Price: 1000 Gold
        skillPurchase[2] = 1000; 
        // skill 3: Intermediate Skill - Price: 2000 Gold
        skillPurchase[3] = 2000; 
        // skill 4: Rare Skill - Price: 3500 Gold
        skillPurchase[4] = 3500; 
        // Skill 5: Ultimate Skill - Price: 6000 Gold
        skillPurchase[5] = 6000; 
    }

    function mint(address account, uint256 Gold) public onlyOwner {
        _mint(account, Gold);
    }

    function burn(uint256 Gold) external {
        _burn(msg.sender, Gold);
    }

    function Skill(uint256 skillId, uint256 Gold) external  {
        skillPurchase[skillId] = Gold;
    }

    function SkillId(uint256 skillId) external {
        require(skillPurchase[skillId] > 0, "Skill id purchace not enough ");
        require(balanceOf(msg.sender) >= skillPurchase[skillId], "Gold is not enough");

        _transfer(msg.sender, kent, skillPurchase[skillId]);
        emit ItemRedeemed(msg.sender, skillId, skillPurchase[skillId]);
    }
}


### Authors
Natinaol Teacher's College
Tenefrancia, John Loyd B.
8215176@ntc.edu.ph
