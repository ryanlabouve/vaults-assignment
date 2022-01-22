//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./BottleCaps.sol";

contract Vault1 {
    BottleCaps public caps;
    mapping(address => uint256) public balanceOf;

    constructor() {}

    function deposit() external payable {
        caps.transferFrom(msg.sender, address(this), msg.value);
        balanceOf[msg.sender] += msg.value;
    }

    function withdraw(uint256 amount) public {
        // how to actually transfer
        caps.transferFrom(address(this), msg.sender, amount);
        balanceOf[msg.sender] -= amount;
    }
}
