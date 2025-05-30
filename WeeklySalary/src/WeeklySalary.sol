// SPDX-License-Identifier: (c) RareSkills
pragma solidity 0.8.28;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {SafeERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import {Ownable2Step, Ownable} from "@openzeppelin/contracts/access/Ownable2Step.sol";

// specification
// - the contract is used to pay contractors weekly
// - a contractor can withdraw a fixed salary every week
// - if they do not withdraw for more than a week, they also withdraw undrawn salary
// - Example: less than 1 week withdraw: 0 salary
// -          more than 1 week withdraw, but less than 2 weeks: 1 week salary
// -          more than 2 weeks withdraw, but less than 3 weeks: 2 weeks salary
// -          etc.
// - if a contractor is deleted, they cannot withdraw anymore
// - no partial payments, if the contract doesn't have enough balance, the function will revert
// - with InsufficientBalance()
contract WeeklySalary is Ownable2Step {
    using SafeERC20 for ERC20;

    constructor(address tokenAddress) Ownable(msg.sender) {
        token = ERC20(tokenAddress);
    }

    struct Contractor {
        uint256 weeklySalary;
        uint256 lastWithdrawal;
    }

    mapping(address => Contractor) public contractors;

    ERC20 public immutable token;

    event ContractorCreated(address indexed contractor, uint256 weeklySalary);
    event ContractorDeleted(address indexed contractor);
    event Withdrawal(address indexed contractor, uint256 amount);

    error ContractorAlreadyExists();
    error InvalidContractorAddress();
    error InvalidWeeklySalary();
    error InsufficientBalance();

    function createContractor(address _contractor, uint256 _weeklySalary) external onlyOwner {
        require(_contractor != address(0), InvalidContractorAddress());
        require(_weeklySalary != 0, InvalidWeeklySalary());
        require(contractors[_contractor].weeklySalary == 0, ContractorAlreadyExists());

        contractors[_contractor] = Contractor({weeklySalary: _weeklySalary, lastWithdrawal: block.timestamp});
        emit ContractorCreated(_contractor, _weeklySalary);
    }

    function deleteContractor(address _contractor) external onlyOwner {
        require(contractors[_contractor].weeklySalary != 0, InvalidContractorAddress());
        delete contractors[_contractor];
    }

    /*
     * @dev if the balance of the contract is not sufficient, the function will revert
     */
    function withdraw() external {
        require(contractors[msg.sender].weeklySalary != 0, InvalidContractorAddress());

        Contractor storage c = contractors[msg.sender];
        uint256 weeksCnt = (block.timestamp - c.lastWithdrawal) / 7 days;
        uint256 totalSalary = weeksCnt * c.weeklySalary;

        require(token.balanceOf(address(this)) >= totalSalary, InsufficientBalance());
        token.safeTransfer(msg.sender, totalSalary);

        c.lastWithdrawal = block.timestamp;

        emit Withdrawal(msg.sender, totalSalary);
    }
}
