#!/bin/bash

# Install OpenVPN if not installed
sudo apt update
sudo apt install -y openvpn wget

#!/bin/bash

# Prompt user for the OpenVPN URL
read -p "Enter the OpenVPN download URL: " vpn_url

# Specify the location where the OVPN file will be saved
output_file=~/Desktop/vpngate.ovpn

# Use wget to download the file from the provided URL
wget -O "$output_file" "$vpn_url"

# Check if the download was successful
if [ $? -eq 0 ]; then
    echo "OpenVPN configuration file downloaded successfully to $output_file."
else
    echo "Failed to download the OpenVPN configuration file. Please check the URL."
fi

sudo mkdir -p /etc/openvpn  # Create the directory if it doesn't exist
sudo mv ~/Desktop/vpngate.ovpn /etc/openvpn/


sudo openvpn --config /etc/openvpn/vpngate.ovpn
