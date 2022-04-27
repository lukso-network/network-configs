#!/bin/bash

echo "USE AT YOUR OWN RISK"
read -p "Are you sure you've double checked the values and want to make this deposit? [y|N]" -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
fi

source secrets.env

if [[ -z "${ETH1_FROM_ADDR}" ]]; then
  echo "need ETH1_FROM_ADDR environment var. Set inside secrets.env"
  exit 1 || return 1
fi
if [[ -z "${ETH1_FROM_PRIV}" ]]; then
  echo "need ETH1_FROM_PRIV environment var. Set inside secrets.env"
  exit 1 || return 1
fi

# Iterate through lines, each is a json of the deposit data and some metadata
while read x; do
   account_name="$(echo "$x" | jq '.account')"
   pubkey="$(echo "$x" | jq '.pubkey')"
   echo "Sending deposit for validator $account_name $pubkey"
   docker run  wealdtech/ethereal beacon deposit \
      --allow-unknown-contract=$FORCE_DEPOSIT \
      --address="$DEPOSIT_CONTRACT_ADDRESS" \
      --connection=$ETH1_RPC \
      --data="$x" \
      --value="$DEPOSIT_ACTUAL_VALUE" \
      --from="$ETH1_FROM_ADDR" \
      --privatekey="$ETH1_FROM_PRIV"
   echo "Sent deposit for validator $account_name $pubkey"
   sleep 3
done < "$DEPOSIT_DATAS_FILE_LOCATION"