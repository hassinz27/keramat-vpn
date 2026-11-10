#!/usr/bin/env bash
set -Eeuo pipefail

BASE="/opt/keramat-vpn"

while true; do
    clear

    echo "================================"
    echo "       KERAMAT VLESS MANAGER"
    echo "================================"
    echo
    echo "1. Create VLESS WebSocket"
    echo "2. Create VLESS gRPC"
    echo "3. List VLESS Accounts"
    echo "4. Delete VLESS Account"
    echo "5. Renew VLESS Account"
    echo "0. Back to Main Menu"
    echo

    read -r -p "Select option: " choice

    case "$choice" in
        1)
            echo "VLESS WebSocket module is being developed."
            read -r -p "Press Enter..."
            ;;
        2)
            echo "VLESS gRPC module is being developed."
            read -r -p "Press Enter..."
            ;;
        3)
            echo "Account listing module is being developed."
            read -r -p "Press Enter..."
            ;;
        4)
            echo "Account deletion module is being developed."
            read -r -p "Press Enter..."
            ;;
        5)
            echo "Account renewal module is being developed."
            read -r -p "Press Enter..."
            ;;
        0)
            exit 0
            ;;
        *)
            echo "Invalid selection."
            sleep 1
            ;;
    esac
done
