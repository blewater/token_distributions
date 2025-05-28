// SPDX-License-Identifier: (c) RareSkills
pragma solidity 0.8.28;

import {IERC20Metadata} from "@openzeppelin/contracts/token/ERC20/extensions/IERC20Metadata.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

// tokenA and tokenB are stablecoins, so they have the same value, but different
// decimals. This contract allows users to trade one token for another at equal rate
// after correcting for the decimals difference

error InsufficientBalance(uint256 amount, uint256 balance);

contract DecimalSwap {
    using SafeERC20 for IERC20Metadata;

    IERC20Metadata public immutable tokenA;
    IERC20Metadata public immutable tokenB;
    uint256 ad;
    uint256 bd;

    constructor(address tokenA_, address tokenB_) {
        tokenA = IERC20Metadata(tokenA_);
        tokenB = IERC20Metadata(tokenB_);
        ad = tokenA.decimals();
        bd = tokenB.decimals();
    }

    function swapAtoB(uint256 amountIn) external {
        tokenA.safeTransferFrom(msg.sender, address(this), amountIn);

        uint256 amountOut = amountIn * 10 ** bd / 10 ** ad;
        require(tokenB.balanceOf(address(this)) >= amountOut, InsufficientBalance(amountOut, tokenB.balanceOf(address(this))));

        tokenB.safeTransfer(address(msg.sender), amountOut);
    }

    function swapBtoA(uint256 amountIn) external {
        tokenB.safeTransferFrom(msg.sender, address(this), amountIn);

        uint256 amountOut = amountIn * 10 ** ad / 10 ** bd;
        require(tokenA.balanceOf(address(this)) >= amountOut, InsufficientBalance(amountOut, tokenA.balanceOf(address(this))));

        tokenA.safeTransfer(msg.sender, amountOut);
    }
}
