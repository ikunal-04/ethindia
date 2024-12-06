# BugHuntr.ai 🔍

BugHuntr.ai is an AI-powered smart contract security analysis tool built on AIA Chain. It helps developers identify potential vulnerabilities in their smart contracts before deployment, making blockchain development safer and more efficient.

## Front-end Application Repo

Here's the front-end application [repo](https://github.com/harishkotra/bughuntrai-frontend)

[Here's the deployed front-end application for this project](https://bughuntrai.vercel.app/)

## Features 🚀

- AI-powered smart contract analysis
- Real-time vulnerability detection
- Gas optimization suggestions
- Reputation-based auditor system
- On-chain report verification
- IPFS integration for detailed reports

## Latest Deployment 📋

```bash
🚀 Starting deployment of BugHuntr.ai...
🔑 Deploying with account: 0xbDe71618Ef4Da437b0406DA72C16E80b08d6cD45
💰 Account balance: 4300.0 AIA
📄 Deploying BugHuntr.ai...
⏳ Waiting for deployment...
✅ BugHuntr.ai deployed to: 0x41B20e82DBFDe8557363Ca0B7C232C7288EA3Aae
```

**Contract Address**: `0x41B20e82DBFDe8557363Ca0B7C232C7288EA3Aae`  
**Network**: AIA Chain Testnet  
**Block Explorer**: [View on AiaScan](https://testnet.aiascan.com/address/0x41B20e82DBFDe8557363Ca0B7C232C7288EA3Aae)

## Quick Start 🌟

### Prerequisites

- Node.js (v16+ recommended)
- npm or yarn
- An AIA Chain wallet with some testnet tokens
- A code editor (VS Code recommended)

### Installation

1. Clone the repo
```bash
git clone https://github.com/yourusername/bughuntrai.git
cd bughuntrai
```

2. Install dependencies
```bash
npm install
```

3. Set up your environment variables
```bash
cp .env.example .env
# Edit .env with your private key and other configurations
```

### Local Development

1. Run tests
```bash
npx hardhat test
```

2. Deploy to AIA testnet
```bash
npx hardhat run scripts/deploy.js --network aiaTestnet
```

### Configuration ⚙️

Create a `.env` file in the root directory:
```plaintext
PRIVATE_KEY=your_private_key_without_0x_prefix
AIA_TESTNET_URL=https://aia-dataseed1-testnet.aiachain.org
```

### Network Details

AIA Testnet Configuration for MetaMask:
- Network Name: AIA Chain Testnet
- RPC URL: https://aia-dataseed1-testnet.aiachain.org
- Chain ID: 1320
- Currency Symbol: AIA
- Block Explorer URL: https://testnet.aiascan.com

## Project Structure 📁

```
bughuntrai/
├── contracts/            # Smart contracts
│   └── BugHuntr.sol     # Main contract
├── scripts/             # Deployment scripts
├── test/               # Test files
├── .env               # Environment variables
└── hardhat.config.js  # Hardhat configuration
```

## Running Tests 🧪

```bash
# Run all tests
npx hardhat test

# Run specific test file
npx hardhat test test/BugHuntr.js

# Run tests with gas reporting
REPORT_GAS=true npx hardhat test
```

## Contributing 🤝

1. Fork the repo
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Acknowledgments 🙏

- Built during the [AIA Chain Inaugural Hackathon](https://www.hackquest.io/en/hackathon/explore/AIA-Chain-Inaugural-Hackathon)
- Powered by AIA Chain infrastructure
- Inspired by the need for better smart contract security tools
