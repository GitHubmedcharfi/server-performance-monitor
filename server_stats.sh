#!/bin/bash

echo "-----------------------------------"
echo "📊 Server Performance Report"
echo "Generated on: $(date)"
echo "-----------------------------------"

echo ""
echo "🧠 CPU Usage:"
top -bn1 | grep "Cpu(s)" | awk '{usage=100 - $8} END {printf "CPU Used: %.2f%%\n", usage}'

echo ""
echo "🧠 Memory Usage:"
free -m | awk '/Mem:/ {
  used=$3
  total=$2
  percent=($3/$2)*100
  printf "Used: %dMB / %dMB (%.2f%%)\n", used, total, percent
}'

echo ""
echo "💽 Disk Usage:"
df -h / | awk 'NR==2 {
  print "Used: " $3 " / Total: " $2 " (" $5 " used)"
}'

echo ""
echo "🔥 Top 5 Processes by CPU:"
ps aux --sort=-%cpu | head -n 6

echo ""
echo "🧠 Top 5 Processes by Memory:"
ps aux --sort=-%mem | head -n 6

echo ""
echo "🖥️ OS Info:"
uname -a

echo ""
echo "⏱️ Uptime:"
uptime -p

echo ""
echo "👤 Logged-in Users:"
who

echo ""
echo "❌ Failed Login Attempts (last 10):"
lastb -n 10 2>/dev/null || echo "Permission denied or command not found."

echo ""
echo "✅ End of Report"

