#! /bin/bash
#
# Create scripts account

exec lighthouse \
  account \
  validator \
  import \
	--datadir /validator_data \
	--testnet-dir /configs \
	--directory /keystores/keys \
	--password-file /validator_data/password.txt \
	--reuse-password