#!/usr/bin/env bash
set -Eeuo pipefail

APP_NAME="Keramat VPN"
APP_DIR="/opt/keramat-vpn"
BIN_LINK="/usr/local/bin/keramat"
LOG_FILE="/var/log/keramat-vpn-install.log"

if [[ "${EUID}" -ne 0 ]]; then
  echo "Sila jalankan sebagai root: sudo bash install.sh"
  exit 1
fi

if [[ ! -r /etc/os-release ]]; then
  echo "Tidak dapat mengesan OS."
  exit 1
fi
. /etc/os-release
if [[ "${ID:-}" != "debian" || "${VERSION_ID:-}" != "13" ]]; then
  echo "Installer ini disasarkan untuk Debian 13 (Trixie). Dikesan: ${PRETTY_NAME:-unknown}"
  exit 1
fi

mkdir -p "${APP_DIR}"/{modules,config,logs} /var/log
exec > >(tee -a "${LOG_FILE}") 2>&1

echo "== ${APP_NAME}: pemasangan asas Debian 13 =="

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y --no-install-recommends \
  bash ca-certificates curl wget jq python3 python3-venv \
  iproute2 procps systemd openssl cron

install -m 0755 ./main.sh "${APP_DIR}/main.sh"
cp -a ./modules/. "${APP_DIR}/modules/"
cp -a ./config/. "${APP_DIR}/config/"

cat > "${APP_DIR}/config/settings.json" <<'JSON'
{
  "project": "Keramat VPN",
  "version": "0.1.0",
  "os_target": "Debian 13",
  "xray_installed": false
}
JSON

cat > /etc/profile.d/keramat-vpn.sh <<'PROFILE'
# Keramat VPN menu is launched manually with: keramat
PROFILE

ln -sfn "${APP_DIR}/main.sh" "${BIN_LINK}"
chmod 0755 "${APP_DIR}/main.sh"

echo
echo "Pemasangan asas selesai."
echo "Buka menu dengan: keramat"
echo "Nota: versi ini menyediakan rangka kerja sahaja; servis Xray belum dipasang atau diubah."
