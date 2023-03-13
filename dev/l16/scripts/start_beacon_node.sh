#! /bin/bash
#
# Starts a beacon node.

exec lighthouse \
  beacon_node \
  --datadir /consensus_data \
  --testnet-dir /configs \
  --merge \
  --execution-endpoints http://localhost:8551 \
  --eth1 \
  --http-allow-sync-stalled \
  --eth1-endpoints http://localhost:8545 \
  --http \
  --http-address 0.0.0.0 \
  --metrics \
  --metrics-address 0.0.0.0 \
  --execution-jwt /configs/jwtsecret \
  --boot-nodes $PRYSM_BOOTSTRAP_NODE \
  --suggested-fee-recipient $GETH_ETHERBASE \
  --debug-level $LH_VERBOSITY
