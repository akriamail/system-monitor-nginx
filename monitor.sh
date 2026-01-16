#!/bin/bash
echo "System Monitoring for Project Team..."
echo "CPU: $(top -bn1 | grep 'Cpu(s)' | awk '{print $2}')%" > index.html
echo "Disk: $(df -h / | awk 'NR==2 {print $5}')" >> index.html
