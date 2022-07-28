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
    --enr-udp-port=9000 \
    --enr-tcp-port=9000 \
    --discovery-port=9000 \
    --http-allow-origin="*" \
    --http-address 0.0.0.0 \
    --metrics-allow-origin="*" \
    --metrics \
    --metrics-address 0.0.0.0 \
    --execution-jwt /configs/jwtsecret \
    --boot-nodes "enr:-MK4QC7HJvDiuFlMDnZ89_PEuFXn4Fnx_R8dO0O2csNwJEY4P9VuUz9bKhX8c3mOC80GfQJ_YXodDSdUB0_P1uDo_jSGAYIgKx5sh2F0dG5ldHOIAjA-RAqKoiWEZXRoMpB9O39zYgAAcf__________gmlkgnY0gmlwhCJbspeJc2VjcDI1NmsxoQPVmKcs1gev8s9_ZXy3Fa_kK81MV4eq7Mfyvs8LLfnrzIhzeW5jbmV0cw-DdGNwgjLIg3VkcIIu4A" \
    --debug-level "debug"