#!/bin/bash

# Install OpenVPN if not installed
sudo apt update
sudo apt install -y openvpn wget

# Check if the VPN config file already exists
CONFIG_FILE="/etc/openvpn/vpngate.ovpn"
if [ ! -f "$CONFIG_FILE" ]; then
    # Prompt the user for the VPN config file URL
    echo "Enter the VPN config file URL:"
    read VPN_URL

    # Download the config file
    wget -O /etc/openvpn/vpngate.ovpn "$VPN_URL"
fi

# Start OpenVPN with the config file
sudo openvpn --config "$CONFIG_FILE"
