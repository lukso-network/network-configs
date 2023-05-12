# LUKSO Network Configurations

This repository contains all [LUKSO Network](https://lukso.network/) blockchain’s configurations. These configurations offer a repeatable, re-usable, simple configuration management and multi-application deployment, to simply load a configuration file with different methods to run the nodes. (eg. Binaries, Docker, etc…)

## **Repository Structure**

### **Devnets**

Devnets are used to test new blockchain parameters, stress-tests and other configs before they will be integrated into the mainnet. They are not meant to run for long or extended periods of time, therefore they can be removed at anytime. 


### **Testnet**

Testnet is the official playground for blockchain developers to build dapps before deployig them on the main network. 

The testnet is also used to test mainnet forks before applying them to mainnet.

### **Mainnet**

Mainnet directory is used to host the future main network configurations, right now it’s used as a template on how the network will look like in the future.

## To participate in the LUKSO blockchain

You need to run one client per layer (**Execution Layer** and **Consensus Layer**) to participate in the network. 

### Execution Layer vs Consensus Layer

Execution layer clients are executing transactions and smart contracts using the Ethereum Virtual Machine (EVM).

The consensus layer functions as the new slot generation and validtaor infrastructure managing the Proof of Stake (Casper FFG) consensus of LUKSO.

### How many clients per Layer
It’s very important to choose one client per layer, for example:

- Geth and Prysm
- Erigon and Lighthouse

Keep in mind that you need to run the execution first. The clients are explained below to which layer they belong. 

## TODO improve below

### How to install, setup and run a node?
There are three different methods to install/setup/run a node:

- [LUKSO CLI](https://github.com/lukso-network/tools-lukso-cli)
- Binary Application
- Docker Container

### How to install the clients

### LUKSO CLI

The LUKSO CLI is a command line tool that install clients and starts clients for you. [See the README of the CLI for details](https://github.com/lukso-network/tools-lukso-cli#readme).


### Binary Applications
Follow the instructions below to install the respective clients:

******************Execution Layer:******************

- [Geth](https://geth.ethereum.org/downloads)

- [Erigon](https://github.com/ledgerwatch/erigon/releases)

******************Consensus Layer:******************

- [Prysm](https://github.com/prysmaticlabs/prysm/releases)
- [Lighthouse](https://github.com/sigp/lighthouse/releases)

### Docker Containers (TBD, not ready yet!)
Docker allows you to separate your applications from your infrastructure so you can deliver software quickly.

******************Execution Layer:******************

- [Geth Client](https://github.com/lukso-network/network-docker-geth-client) **(Under implementation)**

******************Consensus Layer:******************

- [Prysm Client](https://github.com/lukso-network/network-docker-prysm-client) **(Under implementation)**
- [Lighthouse Client](https://github.com/lukso-network/network-docker-lighthouse-client) **(Under implementation)**


**(Under development)**

## How to setup and run the clients
Once you have installed the prefered clients given above, here is what you need to configure and run them. 

### Binary Applications

```bash
# 1 - Clone network-configs repository
git clone https://github.com/lukso-network/network-configs.git
cd network-configs

# 2 - Choose which network you want to join you node. We will use a testnet for this example. 
cd testnets/l16

# 3 - Run your execution and consensus nodes. We will use L16 for this example.

# EXECUTION LAYER
geth --config=./geth/geth.toml

# CONSENSUS LAYER
prysm.sh beacon-chain --config-file=./prysm/prysm-archive-node.yml
```




## **Docker Containers**


**(TBD)**

## **Lusko CLI**

**(Under development)**
