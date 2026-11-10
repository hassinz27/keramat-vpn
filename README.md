# Keramat VPN — Starter 0.1.0

Sasaran: Debian 13 (Trixie), pemasangan minimal tanpa desktop.

## Pemasangan tempatan untuk ujian
Ekstrak ZIP, masuk ke folder projek dan jalankan:

```bash
chmod +x install.sh
sudo bash ./install.sh
```

Kemudian buka menu:

```bash
keramat
```

## Status
Ini ialah rangka kerja awal. Ia memasang keperluan asas dan menu sistem sahaja.
Xray Core, VLESS/VMESS/Trojan, TLS, routing, had IP dan pengurusan akaun belum
dipasang atau diaktifkan. Modul akan dibina dan diuji berperingkat sebelum
digunakan pada VPS sebenar.

## Penerbitan untuk pemasangan satu arahan
Untuk membolehkan pemasangan terus melalui satu arahan `curl | bash`, projek
perlu diterbitkan pada repositori HTTPS yang anda kawal (contohnya GitHub).
Jangan jalankan arahan `curl | bash` daripada sumber yang tidak dipercayai.
