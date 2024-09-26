#!/bin/bash

# Function to check if a package is installed
is_installed() {
    dpkg -l | grep -q "$1"
}

# Install OpenVPN if not installed
if ! is_installed openvpn; then
    echo "Installing OpenVPN..."
    sudo apt update
    sudo apt install -y openvpn wget
else
    echo "OpenVPN is already installed."
fi

# Define the VPN config file path
CONFIG_FILE="/etc/openvpn/vpngate.ovpn"

# Check if the VPN config file already exists
if [ ! -f "$CONFIG_FILE" ]; then
    # Prompt the user for the VPN config file URL
    echo "Enter the VPN config file URL:"
    read VPN_URL

    # Download the config file
    wget -O "$CONFIG_FILE" "$VPN_URL"
else
    echo "VPN config file already exists."
fi

# Start OpenVPN with the config file
echo "Starting OpenVPN..."
sudo openvpn --config "$CONFIG_FILE"
