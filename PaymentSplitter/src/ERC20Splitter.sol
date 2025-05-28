// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract ERC20Splitter {
    using SafeERC20 for IERC20;

    error InsufficientBalance();
    error InsufficientApproval();
    error ArrayLengthMismatch();

    function split(IERC20 token, address[] calldata recipients, uint256[] calldata amounts) external {
        require(recipients.length == amounts.length, ArrayLengthMismatch());
        uint256 len = recipients.length;
        for (uint256 i; i < len; i++) {
            address r = recipients[i];
            uint256 a = amounts[i];
            require(token.allowance(msg.sender, address(this)) >= a, InsufficientApproval());
            require(token.balanceOf(msg.sender) >= a, InsufficientBalance());
            token.safeTransferFrom(msg.sender, r, a);
        }
    }
}
