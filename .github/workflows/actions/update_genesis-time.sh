#!/bin/bash

wget https://storage.googleapis.com/l15-cdn/networks/l15-$ENVIRONMENT/network-config.yaml
GENESIS=`grep GENESIS_TIME network-config.yaml | cut -d ' ' -f 2`
#echo $GENESIS;

ENVIRONMENT=$1

END=3
x=$END
while [ $x -gt 0 ];
do
n=$(($x-1))
kubectl exec -it -n $1 l15-bootnodes-$n -- bash -c 'sudo kill $(sudo lsof -t -i:30405) && sudo sed -i "s/\"genesisStartTime\":.*/\"genesisStartTime\": $GENESIS/g" /opt/lukso/networks/l15-$ENVIRONMENT/config/pandora-genesis.json'
x=$(($x-1))
done

sleep 120

END=8
x=$END
while [ $x -gt 0 ];
do
n=$(($x-1))
kubectl exec -it -n $1 l15-nodes-$n -- bash -c 'sudo kill $(sudo lsof -t -i:30405) && sudo sed -i "s/\"genesisStartTime\":.*/\"genesisStartTime\": $GENESIS/g" /opt/lukso/networks/l15-$ENVIRONMENT/config/pandora-genesis.json'
x=$(($x-1))
done
