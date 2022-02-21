# LUKSO network configs repository

This repository hosts the current LUKSO network specifications. Discussions about design rationale and proposed changes can be brought up and discussed as issues. Solidified, agreed-upon changes to the spec can be made through pull requests.

## Current network configs

| | [PRODUCTION](l15/prod)  | [STAGING](l15/staging)  | [DEVELOPMENT](l15/dev) |
|:------------:| :------------: |:---------------:| :-----:|
|Chain ID| 23      | 232 | 231 |
|Network ID| 23      | 232        |   231 |
|Fork version| 0x83a55317 | 0x73a55317        |    0x63a55317 |


### L16

| | [PRODUCTION](l16/prod) | [STAGING](l16/staging) | [DEVELOPMENT](l16/dev) |
|:------------:|:----------------------:|:----------------------:|:----------------------:|
|Chain ID|        not yet         |        not yet         |        19051978        |
|Network ID|        not yet         |        not yet         |          19051978           |
|Fork version|       not yet        |       not yet         |       0x63a55317       |

#### Bootnode


|                 | [PRODUCTION](l16/prod) | [STAGING](l16/staging) | [DEVELOPMENT](l16/dev) |
|:---------------:|:----------------------:|:----------------------:|:----------------------:|
| Bootnode Beacon |        not yet         |        not yet         |        enr:-MK4QBRXW5-vTUY5JBjnq7tTAlHQATeWpqunVNjbXKM38TUVMHxjA30il_MjMi32h17eMiP7n-Kb5ngCb18ZN-jpImeGAX8N72aqh2F0dG5ldHOIAAAAAAAAAACEZXRoMpBLTbOoYQAAcAUAAAAAAAAAgmlkgnY0gmlwhCJbPjCJc2VjcDI1NmsxoQJ4l43A2x_1nWxiVvfdGXehmALwQ8kBrsjA5smeqHBqjYhzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A        |
|  Bootnode Geth  |        not yet         |        not yet         |          enode://54478105bc09afe0faf45f640341a47f344ed3670a50a23bdfac63f831325e3dd9d57d0bb65a447e54a7638ca48ed02894d480286712eb8f372917d8d07dd617@34.91.62.48:30303           |

## Network services

PRODUCTION:
* https://launchpad.l15.lukso.network/
* https://stats.pandora.l15.lukso.network/
* https://explorer.pandora.l15.lukso.network/
* https://stats.vanguard.l15.lukso.network/
* https://explorer.vanguard.l15.lukso.network/
* https://rpc.l15.lukso.network/

STAGING:
* https://staging.launchpad.l15.lukso.network/
* https://staging.stats.pandora.l15.lukso.network/
* https://staging.explorer.pandora.l15.lukso.network/
* https://staging.stats.vanguard.l15.lukso.network/
* https://staging.explorer.vanguard.l15.lukso.network/
* https://staging.rpc.l15.lukso.network/

DEVELOPMENT:
* https://dev.launchpad.l15.lukso.network/
* https://dev.stats.pandora.l15.lukso.network/
* https://dev.explorer.pandora.l15.lukso.network/
* https://dev.stats.vanguard.l15.lukso.network/
* https://dev.explorer.vanguard.l15.lukso.network/
* https://dev.rpc.l15.lukso.network/

## How to use genesis state generator

In this project repository root use command like:

`./updateGenesisTime.sh l15 dev 1633435200` (example how to generate for l15-dev network*)

*execute command as `sudo` user