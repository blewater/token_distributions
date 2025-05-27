// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract ERC20Splitter {
    using SafeERC20 for IERC20;

    IERC20 internal immutable token;

    error InsufficientBalance();
    error InsufficientApproval();
    error ArrayLengthMismatch();

    function split(IERC20 token, address[] calldata recipients, uint256[] calldata amounts) external {}
}
