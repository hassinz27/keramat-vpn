#!/usr/bin/env bash
set -Eeuo pipefail
BASE="/opt/keramat-vpn"

pause() { read -r -p "Tekan Enter untuk kembali..." _; }
header() {
  clear 2>/dev/null || true
  echo "╔══════════════════════════════════════╗"
  echo "║            KERAMAT VPN               ║"
  echo "║       VPN MANAGEMENT SYSTEM          ║"
  echo "╚══════════════════════════════════════╝"
  echo
}
while true; do
  header
  cat <<'MENU'
 [1] System information
 [2] Install Xray Core (belum diaktifkan)
 [3] VLESS manager (dalam pembangunan)
 [4] VMESS manager (dalam pembangunan)
 [5] TROJAN manager (dalam pembangunan)
 [6] Domain & SSL (dalam pembangunan)
 [7] Routing manager (dalam pembangunan)
 [8] User limits (dalam pembangunan)
 [9] Bandwidth monitor
 [10] Backup & restore (dalam pembangunan)
 [0] Exit
MENU
  echo
  read -r -p "Pilihan: " choice
  case "$choice" in
    1) bash "$BASE/modules/system-info.sh"; pause ;;
    2|3|4|5|6|7|8|10)
       echo "Modul ini belum diaktifkan. Kita bina dan uji satu demi satu."
       pause ;;
    9) bash "$BASE/modules/bandwidth.sh"; pause ;;
    0) exit 0 ;;
    *) echo "Pilihan tidak sah."; sleep 1 ;;
  esac
done
