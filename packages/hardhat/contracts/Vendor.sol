// SPDX-License-Identifier: MIT
pragma solidity 0.8.20; 

import "@openzeppelin/contracts/access/Ownable.sol";
import "./YourToken.sol";

/**
 * @title Vendor
 * @notice A contract that allows buying and selling ERC20 tokens at a fixed rate
 * @dev Implements a token exchange system with a fixed rate of 100 tokens per ETH
 */
contract Vendor is Ownable {
    /// @notice Amount of tokens obtained per 1 ETH
    /// @dev Fixed rate: 100 tokens = 1 ETH
    uint256 public constant tokensPerEth = 100;
    
    /// @notice Instance of the ERC20 token managed by this vendor
    YourToken public yourToken;

    /**
     * @notice Emitted when a user buys tokens
     * @param buyer Address of the buyer
     * @param amountOfETH Amount of ETH sent
     * @param amountOfTokens Amount of tokens received
     */
    event BuyTokens(address buyer, uint256 amountOfETH, uint256 amountOfTokens);
    
    /**
     * @notice Emitted when a user sells tokens
     * @param seller Address of the seller
     * @param amountOfTokens Amount of tokens sold
     * @param amountOfETH Amount of ETH received
     */
    event SellTokens(address seller, uint256 amountOfTokens, uint256 amountOfETH);

    /**
     * @notice Vendor contract constructor
     * @param tokenAddress Address of the token contract to use
     * @dev Constructor creates a new instance of YourToken
     */
    constructor(address tokenAddress) Ownable(msg.sender) {
        
        require(tokenAddress != address(0), "InvalidTokenAddress");
        yourToken =  YourToken(tokenAddress);
    }

    /**
     * @notice Allows users to buy tokens by sending ETH
     * @dev Calculates token amount based on tokensPerEth and transfers to buyer
     */
    function buyTokens() payable public {
      
        require(msg.value > 0, "SendETHToBuyTokens");


        uint256 tokens = msg.value * tokensPerEth;
        


        require(yourToken.balanceOf(address(this)) >= tokens, "InsufficientTokensInContract");  
        require(yourToken.transfer(msg.sender, tokens), "TransferFailed");
    
        emit BuyTokens(msg.sender, msg.value, tokens);
    }

    /**
     * @notice Allows the owner to withdraw all ETH from the contract
     * @dev Only the owner can call this function
     */
    function withdraw() public onlyOwner {
        (bool success,) = payable(msg.sender).call{value: address(this).balance}("");
        require(success,'TransferFailed');
        
    }

    /**
     * @notice Allows users to sell their tokens in exchange for ETH
     * @param amount Amount of tokens to sell
     * @dev Transfers tokens from user to contract and sends equivalent ETH to user
     */
    function sellTokens(uint256 amount) public {
        
     
        require(amount > 0, "MustBeGreaterThan0");
                     
        uint256 ethAmount = amount  / tokensPerEth;
        
        require(address(this).balance >= ethAmount, "InsufficientETH");
        
        yourToken.transferFrom(msg.sender, address(this), amount);
        (bool success,) = payable(msg.sender).call{value: ethAmount}("");
        require(success,'TransferFailed');
        
        
        emit SellTokens(msg.sender, amount, ethAmount);
    }
    
}