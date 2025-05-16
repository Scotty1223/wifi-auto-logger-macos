#!/bin/bash

log_file="$HOME/Documents/wifi_log.csv"

if [ ! -f "$log_file" ]; then
  echo "❌ Log file not found: $log_file"
  exit 1
fi

echo "📊 Wi-Fi Analytics from: $log_file"
echo "--------------------------------------"

# 1. Most-used networks
echo "🔁 Most connected Wi-Fi networks:"
cut -d',' -f2 "$log_file" | sort | uniq -c | sort -nr | head

echo ""
# 2. Connections by hour (peak time analysis)
echo "⏰ Peak connection hours (0-23):"
cut -d',' -f1 "$log_file" | cut -d' ' -f2 | cut -d':' -f1 | sort | uniq -c | sort -nr | head

echo ""
# 3. Total connections logged
echo "🧾 Total logged connections:"
wc -l < "$log_file"
