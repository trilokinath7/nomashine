#!/bin/bash

# Update resolv.conf with a specific nameserver
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

# Start OpenVPN with the given config file
sudo openvpn --config /etc/openvpn/vpngate.ovpn
