// SPDX-License-Identifier: (c) RareSkills
pragma solidity 0.8.28;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract WETH is ERC20("Wrapped Ether", "WETH") {
    function deposit() external payable {}

    function withdraw(uint256 amount) external {}
}
