#! /bin/bash
#
# Starts a beacon node.


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
    --boot-nodes "enr:-MK4QHptxgcppYG9PiFc_dbteq_efGQpgq3KEVDkt9zwgJddP56LaV3o4XS-jgJYADbv6gdrhUegsaqVgSb8e19fmCeGAYFtM7Sph2F0dG5ldHOIAAAAAAAAAACEZXRoMpCUeKqrYQAAcAMAAAAAAAAAgmlkgnY0gmlwhCKNxs-Jc2VjcDI1NmsxoQJQcrUCPeBAqaknqD7DfAv1uexG6Q-Gs1fXvZ9JQ0BoQIhzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A" \
    --suggested-fee-recipient "0x7781121fd00A009670E31b76A2bf99b3A2D6878D" \
    --debug-level "debug"