// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract MockLSP7 {
    mapping(address => uint256) balances;
    mapping(address => mapping(address => uint256)) public authorizedOperators;

    function mint(address to, uint256 amount) external {
        balances[to] += amount;
    }

    function authorizeOperator(address operator, uint256 amount) external {
        authorizedOperators[msg.sender][operator] = amount;
    }

    function transfer(address from, address to, uint256 amount, bool, bytes memory) external {
        require(balances[from] >= amount, "Insufficient balance");
        if (from != msg.sender) {
            require(authorizedOperators[from][msg.sender] >= amount, "Not authorized");
            authorizedOperators[from][msg.sender] -= amount;
        }
        balances[from] -= amount;
        balances[to] += amount;
    }

    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
}
