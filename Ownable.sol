// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ownable {
    address public kent;
    address public newowner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event OwnershipCancelled(address indexed previousOwner);

    constructor() {
        kent = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == kent, "Ownable: caller is not the owner");
        _;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(kent, newOwner);
        newowner = newOwner;
    }

    function cancelTransfer() public onlyOwner {
        require(newowner != address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(kent, newowner);
        kent = newowner;
    }
}
