#!/usr/bin/env bash

RUN_DATE=$(date '+%Y-%m-%d__%H-%M-%S')
BASE_PATH=$HOME/Workspace/lukso/network-deployment

function start_catalyst {
    echo "starting catalyst node..."
    ./bin/geth --catalyst init $BASE_PATH/kintsugi/config/genesis.json --datadir $BASE_PATH/kintsugi/datadir/geth &>/dev/null
    nohup ./bin/geth  \
        --catalyst \
        --datadir $BASE_PATH/kintsugi/datadir/geth \
        --networkid 1337222 \
        --http \
        --http.api "engine,net,eth,admin,debug,miner" \
        --http.addr 0.0.0.0 \
		--ws \
        --ws.api "engine,net,eth,admin,debug,miner" \
        --ethstats atif-l15-test@dev.stats.pandora.l15.lukso.network \
        --verbosity 4 \
        --mine \
        --http.vhosts "*" \
        --http.corsdomain "*" \
        --allow-insecure-unlock \
        --miner.etherbase=0xcce25d1620bd5e33485b808b30d3c805ea28dbe3>$BASE_PATH/kintsugi/datadir/geth/logs/catalyst_"$RUN_DATE".log 2>&1 &
    disown
}

function start_beacon {
	echo "starting beacon node..."
	nohup ./bin/beacon-chain \
	--accept-terms-of-use \
	--force-clear-db \
	--kintsugi-testnet \
	--genesis-state $BASE_PATH/kintsugi/config/genesis.ssz \
	--datadir $BASE_PATH/kintsugi/datadir/beacon \
	--http-web3provider http://localhost:8545 \
	--min-sync-peers 0 \
	--verbosity debug \
	--chain-config-file $BASE_PATH/kintsugi/config/config.yaml>$BASE_PATH/kintsugi/datadir/beacon/logs/beacon_"$RUN_DATE".log 2>&1 & 
}

function start_validator {
	echo "starting validator node..."

	nohup ./bin/validator \
	--accept-terms-of-use \
	--rpc \
	--wallet-password-file $BASE_PATH/kintsugi/datadir/validator/password.txt \
	--chain-config-file $BASE_PATH/kintsugi/config/config.yaml \
	--wallet-dir $BASE_PATH/kintsugi/datadir/validator/prysm \
	--verbosity debug \
	--datadir $BASE_PATH/kintsugi/datadir/validator>$$BASE_PATH/kintsugi/datadir/validator/logs/validator_"$RUN_DATE".log 2>&1 & 

}

function start_deposit_validator {
	echo "starting deposit validator node..."

	nohup ./bin/validator \
	--accept-terms-of-use \
	--rpc \
	--rpc-port 7002 \
	--monitoring-port 8082 \
	--grpc-gateway-port 7502 \
	--wallet-password-file $BASE_PATH/kintsugi/datadir/validator-deposit/password.txt \
	--chain-config-file $BASE_PATH/kintsugi/config/config.yaml \
	--wallet-dir $BASE_PATH/kintsugi/datadir/validator-deposit/prysm \
	--verbosity debug \
	--datadir $BASE_PATH/kintsugi/datadir/validator-deposit>$BASE_PATH/kintsugi/datadir/validator-deposit/logs/deposit_validator_"$RUN_DATE".log 2>&1 & 
}

function start_eth2stats {
	echo "starting eth2 stats client..."

	nohup ./bin/eth2stats-client-Linux-x86_64 run \
	--beacon.type=prysm \
	--data.folder=$BASE_PATH/kintsugi/datadir/eth2stats \
	--eth2stats.node-name=atif-l15-test \
	--eth2stats.addr=34.147.116.58:9090 \
	--eth2stats.tls=false \
	--beacon.metrics-addr=http://127.0.0.1:8080/metrics \
	--beacon.addr=127.0.0.1:4000>$BASE_PATH/kintsugi/datadir/eth2stats/logs/eth2stats_"$RUN_DATE".log 2>&1 & 
}

function generate_genesis {
	echo "generating new genesis ssz for phase0..."

	./bin/eth2-testnet-genesis phase0 \
	--config $BASE_PATH/kintsugi/config/config.yaml  \
	--mnemonics $BASE_PATH/kintsugi/config/mnemonics.yaml  \
	--state-output $BASE_PATH/kintsugi/config/genesis.ssz \
	--tranches-dir  $BASE_PATH/kintsugi/config/tranches \
	--eth1-block 0x2ad13ebbb0c55ec165832d3d4ee32e82623ac22c6223446ce0a4b7b1d2716b58
	# --timestamp $(date +%s)
}

function reset_node {
	echo "resetting whole node...."

	echo "shutting down beacon client..."
    sudo kill -INT $(sudo lsof -t -i:4000) &>/dev/null
    sleep 1
    sudo kill -INT $(sudo lsof -t -i:12000) &>/dev/null
    sleep 1
    sudo kill -INT $(sudo lsof -t -i:13000) &>/dev/null
    sleep 1

    echo "shutting down validator client..."
    sudo kill -INT $(sudo lsof -t -i:7000) &>/dev/null
	sleep 1

	echo "shutting down deposit validator client..."
    sudo kill -INT $(sudo lsof -t -i:7002) &>/dev/null
	sleep 1

	echo "shutting down catalyst client..."
	sudo kill -INT $(sudo lsof -t -i:30303) &>/dev/null
	sleep 1

	echo "shutting down eth2 stats client..."
	sudo pkill "eth2stats-client*"
    sleep 1

    echo "cleanning up datadir..."
    rm -rf $BASE_PATH/kintsugi/datadir/geth/geth;
    rm -rf $BASE_PATH/kintsugi/datadir/beacon/beaconchaindata $BASE_PATH/kintsugi/datadir/beacon/metaData;
    rm -rf $BASE_PATH/kintsugi/datadir/validator/validator.db;

    echo "reset done!"
}


function start_node {
	echo "starting whole node...."

	generate_genesis
	sleep 1

	start_catalyst
	sleep 1

	start_beacon
	sleep 1

	start_validator
	sleep 1

	start_eth2stats
	sleep 1

	echo "successfully started whole node!"
}


function main {
	choiceloop=true;
	while $choiceloop; do
		echo "Choose..."
		echo "1. Deploy catalyst"
		echo "2. Deploy beacon"
		echo "3. Deploy validtor"
		echo "4. Deploy eth2 stats client"
		echo "5. Reset node"
		echo "6. Start node"
		echo "7. Deploy deposit validtor"
		echo "8. Generate genesis ssz"
		echo "9. Exit"

		read choice

		if [ $choice -eq 1 ]; then
			start_catalyst
		elif [ $choice -eq 2 ]; then
			start_beacon
		elif [ $choice -eq 3 ]; then
			start_validator
		elif [ $choice -eq 4 ]; then
			start_eth2stats 
		elif [ $choice -eq 5 ]; then
			reset_node 
		elif [ $choice -eq 6 ]; then
			start_node 
		elif [ $choice -eq 7 ]; then
			 start_deposit_validator
		elif [ $choice -eq 8 ]; then
			 generate_genesis
		else {
			choiceloop=false
			echo "Finish..."
		}
		fi
	done
}

main

