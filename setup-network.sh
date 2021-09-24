#!/usr/bin/env bash

read -p "Network Name: " NETWORK;
read -p "Namespace: " NAMESPACE;
read -p "Chain ID: " CHAIN_ID;
read -p "Network ID: " NETWORK_ID;
read -p "Fork: " FORKCHOICE;
read -p "Genesis start time: " GENESIS_TIME;
read -p "Mnemonic: " MNEMONIC;
read -s -p "Keystore Password " KEYSTORE_PASSWORD;

mkdir -p "networks/$NETWORK/$NAMESPACE";
mkdir -p "secrets/$NETWORK/$NAMESPACE";

echo $MNEMONIC > secrets/$NETWORK/$NAMESPACE/mnemonic.txt;
echo $KEYSTORE_PASSWORD > secrets/$NETWORK/$NAMESPACE/keystore_password.txt;


./deposit existing-mnemonic \
--mnemonic "$MNEMONIC" \
--folder secrets/$NETWORK/$NAMESPACE \
--chain lukso-private-testnet \
--keystore_password "./secrets/$NETWORK/$NAMESPACE/keystore_password.txt";

cp ./secrets/$NETWORK/$NAMESPACE/validator_keys/deposit_data* ./networks/$NETWORK/$NAMESPACE/deposit_data.json;

GENESIS_TIME=$(date +%s);
echo $GENESIS_TIME > networks/$NETWORK/$NAMESPACE/timestamp.txt;

cp ./template/config/pandora-genesis.json ./networks/$NETWORK/$NAMESPACE/pandora-genesis.json;
cp ./template/config/vanguard-config.yaml ./networks/$NETWORK/$NAMESPACE/vanguard-config.yaml;

tmp=$(mktemp);
dst="./networks/$NETWORK/$NAMESPACE/pandora-genesis.json"
jq '.config.chainId = '$CHAIN_ID'' $dst > "$tmp" && mv "$tmp" $dst;
jq '.config.pandora.genesisStartTime = '$GENESIS_TIME'' $dst > "$tmp" && mv "$tmp" $dst;


tmp=$(mktemp);
dst="./networks/$NETWORK/$NAMESPACE/vanguard-config.yaml";
yq eval '.DEPOSIT_CHAIN_ID = '$CHAIN_ID $dst -i;
yq eval '.DEPOSIT_NETWORK_ID = '$NETWORK_ID $dst -i


./genesis-state-gen --deposit-json-file ./networks/$NETWORK/$NAMESPACE/validator_keys/deposit_data* \
  --genesis-time "$GENESIS_TIME" \
  --output-ssz ./networks/$NETWORK/$NAMESPACE/vanguard-genesis.ssz \
  --output-json ./networks/$NETWORK/$NAMESPACE/vanguard-genesis.json \
  --mainnet-config;





