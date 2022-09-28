#!/bin/bash

exec lighthouse \
    beacon_node \
    --datadir /consensus_data \
    --testnet-dir /configs \
    --http-allow-sync-stalled \
    --merge \
    --execution-endpoints http://localhost:8551 \
    --eth1-endpoints http://localhost:8545 \
    --http \
    --http-allow-origin="*" \
    --http-address 0.0.0.0 \
    --metrics-allow-origin="*" \
    --metrics \
    --metrics-address 0.0.0.0 \
    --jwt-secrets /configs/jwtsecret \
    --boot-nodes "enr:-MK4QBEcBjkqG_oy-7OYhRluBA2XpA8ET5ykX6iPNIpmHdsxDeR9ViDqUnKRNMSAwYgshc8KY6uBHm_ep1lKsQjxSH6GAYMiMAJ2h2F0dG5ldHOIAAAAAAAAAACEZXRoMpAJ63JJYgAAcf__________gmlkgnY0gmlwhCKNuqWJc2VjcDI1NmsxoQPrt_s3ruXh8CgxIgQeiDApHxz2EpBTujPBNoI9Qc_FP4hzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A" \
    --suggested-fee-recipient "0x7781121fd00A009670E31b76A2bf99b3A2D6878D" \
    --purge-db \
    --debug-level "trace"