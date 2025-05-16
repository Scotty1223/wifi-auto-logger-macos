#!/bin/bash

log_file="$HOME/Documents/wifi_log.csv"
summary_file="$HOME/Documents/wifi_summary.csv"

# Check if log file exists
if [ ! -f "$log_file" ]; then
  echo "❌ Log file not found: $log_file"
  exit 1
fi

# Write CSV header
echo "SSID,Connections" > "$summary_file"

# Count SSID occurrences and write to summary
cut -d',' -f2 "$log_file" | sort | uniq -c | sort -nr | while read count ssid; do
  echo "$ssid,$count" >> "$summary_file"
done

echo "✅ Summary saved to: $summary_file"
