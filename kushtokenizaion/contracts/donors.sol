// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract KushToken is ERC20, Ownable {
    // Metadata for token
    string public constant TOKEN_NAME = "Kush Token";
    string public constant TOKEN_SYMBOL = "KT";

    // Initial token supply in the first phase (25M tokens with 18 decimals)
    uint256 private constant INITIAL_SUPPLY = 25_000_000 * 10 ** 18;

    // Events
    event TokensAwarded(address indexed donor, uint256 amount);
    event TokensRedeemed(address indexed redeemer, string benefit, uint256 amount);

    constructor() ERC20(TOKEN_NAME, TOKEN_SYMBOL) {
        // Mint initial supply to the owner's address
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    /**
     * @dev Award tokens to a donor.
     * @param donor Address of the donor.
     * @param amount Amount of tokens to award.
     */
    function awardTokens(address donor, uint256 amount) external onlyOwner {
        require(donor != address(0), "Invalid donor address");
        require(amount > 0, "Amount must be greater than zero");
        _mint(donor, amount * 10 ** decimals());
        emit TokensAwarded(donor, amount);
    }

    /**
     * @dev Redeem tokens for specified benefits.
     * @param amount Number of tokens to redeem.
     * @param benefit Description of the benefit.
     */
    function redeemTokens(uint256 amount, string calldata benefit) external {
        require(balanceOf(msg.sender) >= amount, "Insufficient token balance");
        require(bytes(benefit).length > 0, "Benefit description required");

        _burn(msg.sender, amount * 10 ** decimals());
        emit TokensRedeemed(msg.sender, benefit, amount);
    }

    /**
     * @dev View the total supply and the tokens available in circulation.
     * @return Total supply of the token.
     */
    function viewTotalSupply() external view returns (uint256) {
        return totalSupply();
    }
}
