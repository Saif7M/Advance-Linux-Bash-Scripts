#!/bin/bash
echo "Updating system packages..."
sudo apt update -y && sudo apt upgrade -y

echo "Removing unnecessary packages..."
sudo apt autoremove -y

