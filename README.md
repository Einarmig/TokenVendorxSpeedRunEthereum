# 🪙 Token Vendor Challenge

A decentralized token exchange application built on Ethereum that demonstrates ERC-20 token mechanics, automated market making, and token vendor patterns. This project is part of the SpeedRunEthereum challenges.

## 🎯 Project Overview

This token vendor dApp allows users to buy and sell custom ERC-20 tokens at a fixed exchange rate. The vendor contract acts as an automated market maker, maintaining liquidity and handling token swaps between ETH and the custom token.

### Key Features

- **ERC-20 Token Creation**: Custom token with minting capabilities
- **Automated Token Sales**: Fixed-rate ETH to token exchanges
- **Token Buyback**: Users can sell tokens back to the vendor
- **Liquidity Management**: Owner can withdraw ETH and manage token supply
- **Price Discovery**: Transparent and predictable token pricing
- **Event Logging**: Full transaction transparency

## 🔧 Smart Contract Architecture

The project consists of two main contracts:

### 1. YourToken Contract (ERC-20)
A standard ERC-20 token implementation with:
- Token minting and burning capabilities
- Owner-controlled supply management
- Standard transfer and approval mechanisms
- Integration with the vendor contract

### 2. Vendor Contract
The main market-making contract that handles:
- Token purchases with ETH
- Token sales back to ETH
- Liquidity management and withdrawals
- Price calculations and rate management

## 🎮 How It Works

1. **Token Purchase**: Users send ETH to buy tokens at a fixed rate
2. **Token Usage**: Users can transfer tokens like any ERC-20
3. **Token Sale**: Users can sell tokens back to the vendor for ETH
4. **Liquidity Management**: Contract owner manages ETH liquidity

## 🛠️ Technical Implementation

### Key Functions

**YourToken Contract:**
- `mint()`: Create new tokens (owner only)
- `transfer()`: Standard ERC-20 transfers
- `approve()`: Standard ERC-20 approvals

**Vendor Contract:**
- `buyTokens()`: Purchase tokens with ETH at fixed rate
- `sellTokens()`: Sell tokens back for ETH
- `withdraw()`: Owner withdraws ETH from contract
- `tokensPerEth`: Get current exchange rate

### Security Features

- **Access Control**: Owner-only functions for critical operations
- **Input Validation**: Proper checks for zero values and sufficient balances
- **Safe Math**: Protection against overflow/underflow issues
- **Reentrancy Protection**: Secure external call patterns
- **Balance Verification**: Ensure sufficient contract liquidity

## 🔍 Contract Details

### Token Economics
- **Exchange Rate**: Fixed ETH to token ratio
- **Token Supply**: Controlled by contract owner
- **Liquidity Pool**: ETH held in vendor contract
- **Price Stability**: Predictable and transparent pricing

### Events
- `BuyTokens(address indexed buyer, uint256 amountOfETH, uint256 amountOfTokens)`
- `SellTokens(address indexed seller, uint256 amountOfTokens, uint256 amountOfETH)`

## 🚀 Deployment & Testing

### Prerequisites
- Node.js (v16 or higher) and yarn
- Scaffold-ETH 2 framework
- MetaMask or similar wallet
- Git for version control

### Setup
```bash
# Clone the scaffold-eth 2 repository
git clone https://github.com/scaffold-eth/scaffold-eth-2.git token-vendor-challenge
cd token-vendor-challenge

# Install dependencies
yarn install

# Start your local blockchain
yarn chain

# In a new terminal, deploy the contracts
yarn deploy

# In another terminal, start the frontend
yarn start
```

### Test Coverage
```bash
# Run all tests
yarn test
```

- Token minting and distribution scenarios
- ETH to token purchase flows
- Token to ETH selling mechanisms
- Liquidity management operations
- Access control and permission testing
- Edge cases and error conditions

## 🎓 Learning Outcomes

This project demonstrates proficiency in:

- **ERC-20 Token Standards**: Complete token implementation and integration
- **Market Making Logic**: Automated exchange rate mechanisms
- **Liquidity Management**: Pool-based trading systems
- **Access Control Patterns**: Multi-contract owner permissions
- **Economic Modeling**: Token economics and pricing strategies
- **Integration Patterns**: Cross-contract interactions and approvals
- **Frontend Integration**: Web3 wallet connectivity and transaction handling

## 🔗 Links & Deployment

- [SpeedRunEthereum Challenge](https://speedrunethereum.com/)
- [Live Demo](https://tokenvendor-7nqbu4p9i-einarmigs-projects.vercel.app)

### Contract Addresses
- **YourToken Contract**: 0x628463e92033962aB74B98Af4F7376bAbD25005e
- **Vendor Contract**: 0xd0C161B67050d8b88A68DB7041FbE810933Ba57c

### Contract Verification
- [YourToken Contract on Etherscan](https://sepolia.etherscan.io/address/0x628463e92033962aB74B98Af4F7376bAbD25005e)
- [Vendor Contract on Etherscan](https://sepolia.etherscan.io/address/0xd0C161B67050d8b88A68DB7041FbE810933Ba57c)

## 🏆 Challenge Completion

- ✅ ERC-20 token deployed and verified
- ✅ Vendor contract with buy/sell functionality
- ✅ Frontend integration with wallet connectivity
- ✅ All tests passing with full coverage
- ✅ Proper access control and security measures
- ✅ Gas optimizations implemented

---

*Built with ❤️ as part of the Ethereum developer journey*