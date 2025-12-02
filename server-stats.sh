#!/bin/bash

echo "cpu usage"
cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8"%"}')
echo "Total CPU Usage: $cpu_usage"
echo ""

echo "memory usage"
mem_total=$(free -m | awk '/Mem:/ {print $2}')
mem_used=$(free -m | awk '/Mem:/ {print $3}')
mem_free=$(free -m | awk '/Mem:/ {print $4}')
mem_percent=$(free | awk '/Mem:/ {printf("%.2f"), $3/$2 * 100}')

echo "Total Memory: ${mem_total}MB"
echo "Memory Used: ${mem_used}MB"
echo "Memory Free: ${mem_free}MB"
echo "Memory Usage: ${mem_percent}MB"
echo ""

echo "Disk Usage:"
df -h --total | grep 'total'
echo ""

echo "Top 5 Processes by CPU:"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6
echo ""

echo "Top 5 Processes by Memory:"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6
echo ""
