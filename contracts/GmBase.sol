// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GmBase {
    address public owner;
    uint256 public constant GM_PRICE = 0.00005 ether;

    event GM(address indexed from, string message, uint256 timestamp);

    constructor(address _owner) {
        owner = _owner;
    }

    function gm(string calldata message) external payable {
        require(msg.value == GM_PRICE, "Send exactly 0.00005 ETH");
        emit GM(msg.sender, message, block.timestamp);
    }

    function withdraw() external {
        require(msg.sender == owner, "Not owner");
        payable(owner).transfer(address(this).balance);
    }
}
