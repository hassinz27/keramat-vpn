#!/usr/bin/env bash
set -Eeuo pipefail

echo "=================================="
echo "       KERAMAT VPN SYSTEM"
echo "=================================="

echo "OS INFORMATION:"
. /etc/os-release
echo "$PRETTY_NAME"

echo
echo "KERNEL:"
uname -r

echo
echo "UPTIME:"
uptime -p

echo
echo "MEMORY:"
free -h

echo
echo "DISK:"
df -h /

echo
echo "NETWORK:"
ip -brief address

echo
echo "=================================="
echo "       KERAMAT VPN"
echo "=================================="
