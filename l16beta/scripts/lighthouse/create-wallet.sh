#! /bin/bash
#
# Create lighthouse account

exec lighthouse \
  account \
  validator \
  import \
	--datadir /validator_data \
	--testnet-dir /configs \
	--directory /validator_data/keys \
	--password-file /validator_data/password.txt \
	--reuse-password