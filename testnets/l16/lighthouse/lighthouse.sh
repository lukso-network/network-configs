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
    --boot-nodes "enr:-MK4QN2zRIJ3s-GUSUjKz7oeqPJWI575-_Vq8O3aowVEXXymNuDGEAbVQ7YGRTSAJikZOtsjd7xbe2CfhzCqsNG4gISGAYGKYijSh2F0dG5ldHOIAAAAAAAAAACEZXRoMpB9O39zYgAAcf__________gmlkgnY0gmlwhCKNxs-Jc2VjcDI1NmsxoQMEBOjx5h002S6OmHAZLELspbivT2DqRjQXGmWMUURfiIhzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A" \
    --suggested-fee-recipient "0x7781121fd00A009670E31b76A2bf99b3A2D6878D" \
    --terminal-total-difficulty-override=12000000000 \
    --purge-db \
    --debug-level "trace"