// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract KushToken is ERC20, Ownable, Pausable {
    uint256 public constant INITIAL_SUPPLY = 25000000 * 10**18; // 25M tokens
    uint256 public tokenPrice = 1 * 10**18; // 1 KSH initial price

    event TokensPurchased(address buyer, uint256 amount);
    event PriceUpdated(uint256 newPrice);

    constructor() ERC20("Kush Token", "KT") {
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function setTokenPrice(uint256 _newPrice) external onlyOwner {
        tokenPrice = _newPrice;
        emit PriceUpdated(_newPrice);
    }

    function buyTokens() external payable whenNotPaused {
        require(msg.value > 0, "Must send KSH");
        uint256 tokenAmount = (msg.value * 10**18) / tokenPrice;
        _transfer(owner(), msg.sender, tokenAmount);
        emit TokensPurchased(msg.sender, tokenAmount);
    }

    function withdraw() external onlyOwner {
        payable(owner()).transfer(address(this).balance);
    }

    function pause() external onlyOwner {
        _pause();
    }

    function unpause() external onlyOwner {
        _unpause();
    }
}
