#!/bin/bash

# Update and upgrade the system
sudo apt update
clear
# Check if OpenVPN is installed
if ! dpkg -l | grep -qw openvpn; then
    # If OpenVPN is not installed, install it
    sudo apt install -y openvpn
else
    echo "OpenVPN is already installed."
fi
clear
# Define the path for the OpenVPN config file
FILE="/etc/openvpn/vpngate.ovpn"

if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "$FILE does not exist."
    clear
    read -p "PASTE YOUR VPN LINK: " CRP
    wget -O vpngate.ovpn "$CRP"
    sudo mv ~/vpngate.ovpn /etc/openvpn/

fi
clear

# Update resolv.conf with a specific nameserver
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

# Start OpenVPN with the given config file
sudo openvpn --config /etc/openvpn/vpngate.ovpn
