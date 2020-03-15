# Create a Wireguard Interface
ip link add dev wg0 type wireguard
ip address add dev wg0 192.168.200.1/24
wg set wg0 listen-port $LISTEN_PORT private-key $PRIVATE_KEY peer $PEER allowed-ips $ALLOWED_IPS endpoint $ENDPOINT
ip link set up dev wg0
