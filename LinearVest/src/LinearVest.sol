// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

// LinearVest is a contract that releases tokens to a recipient linearly over a specified period.
// For example, if 100 tokens are vested over 100 days, the recipient will receive 1 token per day.
// However, the vesting happens every second, so every update to the block.timestamp means the amount
// withdrawable is updated. The contract should track the amount of tokens the user has withdrawn so far.
// For example, if the vesting period is 4 hours, then after 1 hour, 1/4th of the tokens are withdrawable.

// Be careful to track the amount withdrawn per-vesting. The same user might have multiple vestings using
// the same token.

// Lifecycle:
// Sender deposits tokens into the contracts and creates a vest
// Receiver can withdraw their tokens at any time, but only up to the amount released
// The receiver can identify vests that belong to them by scanning for events that contain
// their address as the recipient

contract LinearVest {
    using SafeERC20 for IERC20;

    struct Vest {
        address token;
        uint40 startTime;
        address recipient;
        uint40 duration;
        uint256 amount;
        uint256 withdrawn;
    }

    mapping(bytes32 => Vest) public vests;
    bytes32[] public vestIds;

    // Events
    event VestCreated(
        address indexed sender,
        address indexed recipient,
        address token,
        uint256 amount,
        uint256 startTime,
        uint256 duration
    );

    event VestWithdrawn(
        address indexed recipient, bytes32 indexed vestId, address token, uint256 amount, uint256 timestamp
    );

    /*
     * @notice Creates a vest
     * @param token The token to vest
     * @param recipient The recipient of the vest
     * @param amount The amount of tokens to vest
     * @param startTime The start time of the vest in seconds
     * @param duration The duration of the vest in seconds
     * @param salt Allows for multiple vests to be created with the same parameters
     */
    function createVest(
        IERC20 token,
        address recipient,
        uint256 amount,
        uint40 startTime,
        uint40 duration,
        uint256 salt
    ) external {}

    /**
     * @notice Withdraws a vest
     * @param vestId The ID of the vest to withdraw
     * @param amount The amount to withdraw. If amount is greater than the amount withdrawable,
     * the amount withdrawable is withdrawn.
     */
    function withdrawVest(bytes32 vestId, uint256 amount) external {}

    /*
     * @notice Computes the vest ID for a given vest
     * @param token The token to vest
     * @param recipient The recipient of the vest
     * @param amount The amount of tokens to vest
     * @param startTime The start time of the vest in seconds
     * @param duration The duration of the vest in seconds
     * @param salt Allows for multiple vests to be created with the same parameters
     * @return The vest ID, which is the keccak256 hash of the vest parameters
     */
    function computeVestId(
        IERC20 token,
        address recipient,
        uint256 amount,
        uint40 startTime,
        uint40 duration,
        uint256 salt
    ) public pure returns (bytes32) {}
}
