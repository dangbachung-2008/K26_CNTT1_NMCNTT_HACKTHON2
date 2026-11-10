#!/bin/bash
# Script: tong_hop.sh
# Tac gia: Sinh vien
# Ngay tao: 10/11/2026
echo "Dang tao bao cao..."
echo "=== BAO CAO SU CO WEBSITE ===" > "logs/tong_hop.txt"
grep "status=404" "logs/access.log" >> "logs/tong_hop.txt"
grep -c "status=500" "logs/access.log" >> "logs/tong_hop.txt"
echo "Hoan thanh!"
