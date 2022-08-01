#! /bin/bash
#
# Starts a validator.

exec lighthouse \
    vc \
	  --datadir ./validator_data \
	  --testnet-dir ./configs \
	  --http \
	  --metrics \
	  --init-slashing-protection \
	  --beacon-nodes http://localhost:5052 \
    --suggested-fee-recipient $GETH_ETHERBASE \
    --debug-level $LH_VERBOSITY