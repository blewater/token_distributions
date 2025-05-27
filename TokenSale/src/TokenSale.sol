// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

// the token should have a maximum supply of 100,000,000 tokens
// the token contract should have 10 decimals
// the price of one token should be 0.001 ether
// tokens should not exist until someone buys them using `buyTokens`
// users should also be able to buy tokens by sending ether to the contract
// then the contract calculates the amount of tokens to mint
contract TokenSale is ERC20("TokenSale", "TS") {
    uint8 public constant DECIMALS = 10;
    uint256 public constant MAX_SUPPLY = 100_000_000 * 10 ** DECIMALS;
    uint256 public constant PRICE_PER_UNIT = 0.001 ether / 10 ** DECIMALS;

    error MaxSupplyReached();

    function decimals() public pure override returns (uint8) {
        return DECIMALS;
    }

    receive() external payable {
        uint256 tokensToMint = msg.value / PRICE_PER_UNIT;
        require(totalSupply() + tokensToMint <= MAX_SUPPLY, MaxSupplyReached());
        _mint(msg.sender, tokensToMint);
    }
}
