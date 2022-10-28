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
    --boot-nodes "enr:-MK4QJkC-vCoK9a4OQaHwe7_7h4DiM2x89i4LGrRz51LGXHef1pYseV_s5-2KLbBNEaXLbP-4gTOGimj-Aolsy3oa52GAYM7EKCIh2F0dG5ldHOIAAAAAAAAAACEZXRoMpB0zhwGICAAAgMAAAAAAAAAgmlkgnY0gmlwhCKTabqJc2VjcDI1NmsxoQIjlMhzyJT_twdO7Hw2j31x-HKJMfIBLiNkOlr_I8CtPIhzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A" \
    --suggested-fee-recipient "0x7781121fd00A009670E31b76A2bf99b3A2D6878D" \
    --purge-db \
    --debug-level "trace"