# Reference: https://www.wireguard.com/quickstart/

# Create a Wireguard Interface
ip link add dev wg0 type wireguard
ip address add dev wg0 192.168.200.1/24

# Create Private Key
mkdir -p /etc/keys
umask 077
wg genkey > /etc/keys/private
wg pubkey < /etc/keys/private > /etc/keys/public

# Create Wireguard Server
wg set wg0 listen-port $LISTEN_PORT private-key $PRIVATE_KEY peer $PEER allowed-ips $ALLOWED_IPS endpoint $ENDPOINT

# Set Interface up
ip link set up dev wg0
