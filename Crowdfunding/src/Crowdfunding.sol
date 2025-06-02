// SPDX-License-Identifier: (c) RareSkills
pragma solidity 0.8.28;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

contract Crowdfunding {
    using SafeERC20 for IERC20;

    IERC20 public immutable token;
    address public immutable beneficiary;
    uint256 public immutable fundingGoal;
    uint256 public immutable deadline;
    uint256 private amount_contrib;

    mapping(address => uint256) public contributions;

    event Contribution(address indexed contributor, uint256 amount);
    event CancelContribution(address indexed contributor, uint256 amount);
    event Withdrawal(address indexed beneficiary, uint256 amount);

    constructor(address token_, address beneficiary_, uint256 fundingGoal_, uint256 deadline_) {
        require(token_ != address(0), "Token address cannot be 0");
        require(uint160(beneficiary_) != 0, "Beneficiary address cannot be 0");
        require(fundingGoal_ != 0, "Funding goal must be greater than 0");
        require(block.timestamp <= deadline_, "Deadline must be in the future");

        token = IERC20(token_);
        fundingGoal = fundingGoal_;
        beneficiary = beneficiary_;
        deadline = deadline_;
    }

    /*
     * @notice a contribution can be made if the deadline is not reached.
     * @param amount the amount of tokens to contribute.
     */
    function contribute(uint256 amount) external {
        require(block.timestamp < deadline, "Contribution period over");
        token.safeTransferFrom(msg.sender, address(this), amount);
        contributions[msg.sender] += amount;
        amount_contrib += amount;
        emit Contribution(msg.sender, amount);
    }

    /*
     * @notice a contribution can be cancelled if the goal is not reached. Returns the tokens to the contributor.
     */
    function cancelContribution() external {
        require(amount_contrib < fundingGoal, "Cannot cancel after goal reached");
        uint256 amount = contributions[msg.sender];
        if (amount > 0) {
            contributions[msg.sender] = 0;
            token.safeTransfer(msg.sender, amount);
            amount_contrib -= amount;
            emit CancelContribution(msg.sender, amount);
        }
    }

    /*
     * @notice the beneficiary can withdraw the funds if the goal is reached.
     */
    function withdraw() external {
        require(msg.sender == beneficiary, "Only beneficiary can withdraw");
        require(block.timestamp >= deadline, "Funding period not over");
        require(amount_contrib >= fundingGoal, "Funding goal not reached");

        uint256 funds = token.balanceOf(address(this));
        token.safeTransfer(beneficiary, funds);

        emit Withdrawal(beneficiary, funds);
    }
}
