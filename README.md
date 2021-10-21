# LUKSO network configs repository

This repository hosts the current LUKSO network specifications. Discussions about design rationale and proposed changes can be brought up and discussed as issues. Solidified, agreed-upon changes to the spec can be made through pull requests.

## Current network configs

| | [PRODUCTION](l15/prod)  | [STAGING](l15/staging)  | [DEVELOPMENT](l15/dev) |
|:------------:| :------------: |:---------------:| :-----:|
|Chain ID| 23      | 232 | 231 |
|Network ID| 23      | 232        |   231 |
|Fork version| 0x83a55317 | 0x73a55317        |    0x63a55317 |

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