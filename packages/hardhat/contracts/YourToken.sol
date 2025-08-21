// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title YourToken
 * @notice A basic ERC20 token implementation
 * @dev Extends OpenZeppelin's ERC20 implementation with initial token minting
 */
contract YourToken is ERC20 {
    /**
     * @notice Constructs the YourToken contract
     * @dev Mints 1000 tokens (with 18 decimals) to the contract deployer
     */
    constructor() ERC20("Gold", "GLD") {
        // Mint 1000 tokens to the deployer (1000 * 10^18 considering 18 decimals)
        _mint(msg.sender, 1000 * 10 ** 18);
    }
}