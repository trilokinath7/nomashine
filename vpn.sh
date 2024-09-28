#!/bin/bash

# Update and upgrade the system
sudo apt update

# Check if OpenVPN is installed
if ! dpkg -l | grep -qw openvpn; then
    # If OpenVPN is not installed, install it
    sudo apt install -y openvpn
else
    echo "OpenVPN is already installed."
fi

# Define the path for the OpenVPN config file
CONFIG_PATH="/etc/openvpn/vpngate.ovpn"

# Check if the OpenVPN config file is already downloaded
if [ ! -f "$CONFIG_PATH" ]; then
    # Ask the user for the download link
    read -p "Please provide the link to download the OpenVPN config file: " vpn_link
    wget -O "$CONFIG_PATH" "$vpn_link"
else
    echo "The OpenVPN config file already exists at $CONFIG_PATH."
fi

# Update resolv.conf with a specific nameserver
echo "nameserver 8.8.8.8" | sudo tee /etc/resolv.conf > /dev/null

# Start OpenVPN with the config file
sudo openvpn --config "$CONFIG_PATH"
