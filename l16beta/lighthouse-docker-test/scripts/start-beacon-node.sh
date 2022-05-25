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
    --metrics-allow-origin="*" \
    --metrics \
    --jwt-secrets /execution_data/geth/jwtsecret \
    --boot-nodes "enr:-MK4QJ170_c4shhTN7NYc0ZiumYUrME_YUcWw_d8W6KKPHtHYVTVogsTqsQZDY_R3VlWnpKW-tIMJeB2JOIvo0D3Gi6GAYDxIN1yh2F0dG5ldHOIAAAAAAAAAACEZXRoMpCBQMXLYgAAcf__________gmlkgnY0gmlwhCJaVcaJc2VjcDI1NmsxoQI6qePHCvwjkh8CMvuUaSWTNiYkFzZpZh3j-DgNjBLvo4hzeW5jbmV0cwCDdGNwgjLIg3VkcIIu4A" \
    --suggested-fee-recipient "0x7781121fd00A009670E31b76A2bf99b3A2D6878D"