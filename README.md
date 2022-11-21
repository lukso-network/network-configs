# **Repository Overview - network-configs**

# **Description**

This repository contains all [Lukso Network](https://lukso.network/) blockchain’s configurations. These configurations offer a repeatable, re-usable, simple configuration management and multi-application deployment, to simply load a configuration file with different methods to run the nodes. (eg. Binaries, Docker, etc…)

# **Repository Structure**

The high-level overview of the repository structure looks like this:

```bash
├── README.md
├── dev
│   └── <networkDigits>
│       ├── geth
│       │   ├── genesis.json
│       │   └── geth.toml
│       ├── lighthouse
│       │   ├── config.yaml
│       │   ├── deploy_block.txt
│       │   ├── genesis.ssz
│       │   └── lighthouse.sh
│       └── prysm
│           ├── config.yml
│           ├── genesis.ssz
│           ├── prysm-beacon.yml
│           └── prysm-validator.yml
├── l16
│   ├── bootnode
│   │   └── bootnodes.json
│   ├── configs
│   │   ├── config.yaml
│   │   ├── deploy_block.txt
│   │   ├── genesis.json
│   │   ├── genesis.ssz
│   │   └── lh_config.yaml
│   ├── docker
│   │   ├── default.env
│   │   ├── docker-compose.lh.yml
│   │   ├── docker-compose.prysm.yml
│   │   └── docker-compose.teku.yml
│   ├── node_params.json
│   └── scripts
│       ├── create_wallet.sh
│       ├── start_beacon_node.sh
│       └── start_validator.sh
├── mainnet
│   ├── geth
│   │   └── genesis.json
│   └── prysm
│       └── config.yaml
└── testnets
    └── l16
        ├── geth
        │   ├── genesis.json
        │   └── geth.toml
        ├── lighthouse
        │   ├── config.yaml
        │   ├── deploy_block.txt
        │   ├── genesis.ssz
        │   └── lighthouse.sh
        └── prysm
            ├── config.yml
            ├── genesis.ssz
            ├── prysm-beacon.yml
            └── prysm-validator.yml
```

As per the repository structure, there are four sections to the repository, namely

- **dev**
- **l16 [ DIRECTORY DEPRECATION SOON ]**
- **testnets**
- **mainnet**

## **Devnets**

Devnets are used to test new blockchain parameters, stress-tests and other configs before they will be integrated into the mainnet. They are not meant to run for long or extended periods of time, therefore they can be removed anytime soon. 

Based on the folder structure, there can be multiple devnets running at same time, this depends on how many 4 digit directories can be found under the dev directory.

## L16 **[ DIRECTORY DEPRECATION SOON ]**

L16 directory is used for the official Lukso L16 Testnet. The latest released CLI version is using this configuration structure, however this configuration structure will be deprecated as soon as we have the new CLI version released.

## **Testnets**

Testnets are official playgrounds for blockchain developers to test L2 operations before integrating them into the main network. 

The L16 directory from the parent structure (which will be deprecated) is moved into testnet directory with the new configuration structure. The newer versions of the CLI will be integrated within this new structure. 

Based on the folder structure, there can be multiple testnets running at same time.

## **Mainnet**

Mainnet directory is used to host the future main network configurations, right now it’s used as a template on how the network will look like in the future.

# **To participate into the Lukso blockchain** 
You only need to run a client on each layer (**Execution Layer** and **Consensus Layer**) to participate into the network. 

## **Execution Layer vs Consensus Layer**

Execution layer clients run on the execution layer to maintain and manage the overall state of the blockchain while also completing the transactions using virtual machines.

The consensus layer serves as the new backend infrastructure for the Lukso blockchain, hosting and verifying the efficacy of validators.

## **How many clients per Layer** 
It’s very important to choose a single client per layer, for example:

- Geth and Prysm
- Geth and Lighthouse

Keep in mind that you need to run the execution first. The clients are explained below to which layer they belong. 

# **How to install, setup and run a node?**
There are three different methods to install/setup/run a node:

- Binary Application
- Docker Container
- Lukso CLI **(New version is under development)**

# **How to install the clients**

## **Binary Applications**
Binary files are commonly used when building applications and other types of software.

******************Execution Layer:******************

- [Geth Client](https://geth.ethereum.org/docs/install-and-build/installing-geth) (Choose the installation method available for your OS)

******************Consensus Layer:******************

- [Prysm Client](https://docs.prylabs.network/docs/install/install-with-script) (Follow only the first paragrpah of the second step)
- [Lighthouse Client](https://lighthouse-book.sigmaprime.io/installation.html) **(Under implementation)**

## **Docker Containers**
Docker allows you to separate your applications from your infrastructure so you can deliver software quickly.

******************Execution Layer:******************

- [Geth Client](https://github.com/lukso-network/network-docker-geth-client) **(Under implementation)**

******************Consensus Layer:******************

- [Prysm Client](https://github.com/lukso-network/network-docker-prysm-client) **(Under implementation)**
- [Lighthouse Client](https://github.com/lukso-network/network-docker-lighthouse-client) **(Under implementation)**

## **Lukso CLI**

Lukso CLI is an autoamted Command Line Interface to spin up a Lukso node with ease

**(Under development)**

# **How to setup and run the clients**
Once you have installed the prefered clients given above, here is what you need to configure and run them. 

## **Binary Applications**

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