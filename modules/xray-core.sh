#!/usr/bin/env bash
set -Eeuo pipefail

echo "=================================="
echo "       KERAMAT VPN"
echo "       XRAY CORE INSTALLER"
echo "=================================="

if [[ "$EUID" -ne 0 ]]; then
    echo "Please run as root."
    exit 1
fi

. /etc/os-release

if [[ "$ID" != "debian" || "$VERSION_ID" != "13" ]]; then
    echo "Debian 13 required."
    exit 1
fi

echo "[1/3] Checking dependencies..."

apt-get update
apt-get install -y curl ca-certificates

echo "[2/3] Downloading official installer..."

TMP_FILE=$(mktemp)
trap 'rm -f "$TMP_FILE"' EXIT

curl -fsSL \
https://github.com/XTLS/Xray-install/raw/main/install-release.sh \
-o "$TMP_FILE"

echo "[3/3] Installing Xray Core..."

bash "$TMP_FILE" install --without-geodata

echo
echo "=================================="
echo "       XRAY INSTALLATION DONE"
echo "=================================="

xray version
