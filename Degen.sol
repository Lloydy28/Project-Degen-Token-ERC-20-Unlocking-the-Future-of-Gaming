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
