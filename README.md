# **Repository Overview - network-configs**

# **Description**

This repository contains all [Lukso Network](https://lukso.network/) blockchain’s configurations. These configurations offer a repeatable, re-usable, simple configuration management and multi-application deployment, to simply load a configuration file with different methods to run the nodes. (eg. Binaries, Docker, etc…)

# **Repository Structure**

The high-level overview of the repository structure looks like this:
``

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
└── testnet
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

- dev
- l16
- testnet
- mainnet

## Devnet

Devnets are used to test new blockchain parameters, stress-tests and other configs before they will be integrated into the mainnet. They are not meant to run for long or extended periods of time, therefore they can be removed anytime soon. 

Based on the folder structure, there can be multiple devnets running at same time, this depends on how many 4 digit directories can be found under the dev directory.

## L16 [ DIRECTORY DEPRECATION SOON ]

L16 directory is used for the official Lukso L16 Testnet. The latest released CLI version is using this configuration structure, however this configuration structure will be deprecated as soon as we have the new CLI version released.

## Testnet

Testnets are official playgrounds for blockchain developers to test L2 operations before integrating them into the main network. 

The L16 directory from the parent structure (which will be deprecated) is moved into testnet directory with the new configuration structure. The newer versions of the CLI will be integrated with this new structure. 

## Mainnet

Mainnet directory is used to host the future main network configurations, right now it’s used as a template on how the network will look like in the future. 

# How to run a node?

This section is redirecting you to other repositories which explain how to setup a node using your preferred method and client.

It’s very important to choose a single client for each layer (Execution and Consensus), for example:

- Geth and Prysm
- Geth and Lighthouse

## Binaries

******************Execution******************

- Geth Client [Under Implementation]

******************Consensus******************

- Prysm Client [Under Implementation]
- Lighthouse Client [Under Implementation]

## Docker

******************Execution******************

- [Geth Client](https://github.com/lukso-network/network-docker-geth-client)

******************Consensus******************

- [Prysm Client](https://github.com/lukso-network/network-docker-prysm-client)
- [Lighthouse Client](https://github.com/lukso-network/network-docker-lighthouse-client) [Under Implementation]
