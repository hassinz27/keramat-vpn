#!/usr/bin/env bash
set -Eeuo pipefail

echo "=================================="
echo "       KERAMAT VPN BANDWIDTH"
echo "=================================="

echo "NETWORK INTERFACES:"
ip -brief link

echo
echo "TRAFFIC COUNTERS:"

for iface in /sys/class/net/*; do
    name=$(basename "$iface")

    [[ "$name" == "lo" ]] && continue

    rx=$(cat "$iface/statistics/rx_bytes")
    tx=$(cat "$iface/statistics/tx_bytes")

    rx_mb=$(awk "BEGIN {printf \"%.2f\", $rx/1048576}")
    tx_mb=$(awk "BEGIN {printf \"%.2f\", $tx/1048576}")

    echo "Interface: $name"
    echo "Download: $rx_mb MB"
    echo "Upload: $tx_mb MB"
    echo
done

echo "=================================="
echo "       KERAMAT VPN"
echo "=================================="
