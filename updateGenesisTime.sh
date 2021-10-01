#!/usr/bin/env bash
NETWORK=$1
NAMESPACE=$2
GENESIS_TIME=$3

tmp=$(mktemp)
dst="./$NETWORK/$NAMESPACE/pandora-genesis.json"
jq '.config.pandora.genesisStartTime = '$GENESIS_TIME'' $dst >"$tmp" && mv "$tmp" $dst

tmp=$(mktemp)
dst="./$NETWORK/$NAMESPACE/vanguard-config.yaml"
yq eval '.MIN_GENESIS_TIME = '$GENESIS_TIME $dst >"$tmp" && mv "$tmp" $dst

tmp=$(mktemp)
dst="./$NETWORK/$NAMESPACE/network-config.yaml"
yq eval '.GENESIS_TIME = '$GENESIS_TIME $dst >"$tmp" && mv "$tmp" $dst

rm -f $NETWORK/$NAMESPACE/vanguard-genesis.ssz \
$NETWORK/$NAMESPACE/vanguard-genesis.json

./genesis-state-gen-dev \
  --deposit-json-file $NETWORK/$NAMESPACE/deposit_data.json \
  --genesis-time $GENESIS_TIME \
  --output-ssz $NETWORK/$NAMESPACE/vanguard-genesis.ssz \
  --output-json $NETWORK/$NAMESPACE/vanguard-genesis.json \
  --mainnet-config

#echo gsutil cp ./$NETWORK/$NAMESPACE/* gs://l15-cdn/networks/$NETWORK/$NAMESPACE
