#!/bin/bash

# File to store logs
log_file="$HOME/Documents/wifi_log.csv"

# Get SSID
ssid=$(networksetup -getairportnetwork en0 | awk -F': ' '{print $2}')

# Get timestamp
timestamp=$(date "+%Y-%m-%d %H:%M:%S")

# Append to CSV
echo "$timestamp,$ssid" >> "$log_file"

# Optional desktop notification
osascript -e "display notification \"Connected to $ssid\" with title \"Wi-Fi Logger\""
