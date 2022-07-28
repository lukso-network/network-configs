#! /bin/bash
#
# Starts a validator node.

lighthouse account validator import \
	--datadir ./validator_data \
	--testnet-dir ./configs \
	--directory ./validator_data/keys \
	--password-file ./validator_data/password.txt \
	--reuse-password 

exec lighthouse vc \
	  --datadir ./validator_data \
	  --testnet-dir ./configs \
	  --http \
	  --metrics \
	  --init-slashing-protection \
	  --beacon-nodes http://localhost:5052 \
      --graffiti "atif-lighthouse-07" \
      --suggested-fee-recipient "0x7781121fd00A009670E31b76A2bf99b3A2D6878D" \
      --debug-level debug
