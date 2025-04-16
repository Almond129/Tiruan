#!/bin/bash
set -e

echo "[*] Updating & installing dependencies"
apt update && apt upgrade -y
apt install -y build-essential curl wget ufw libssl3

echo "[*] Checking glibc version"
GLIBC_VERSION=$(ldd --version | head -n1 | grep -oE '[0-9]+\.[0-9]+')
if [[ "$GLIBC_VERSION" != "2.34" ]]; then
  echo "[*] Installing glibc 2.34..."
  mkdir -p /opt/glibc && cd /opt/glibc
  wget http://ftp.gnu.org/gnu/libc/glibc-2.34.tar.gz
  tar -xzf glibc-2.34.tar.gz && cd glibc-2.34
  mkdir build && cd build
  ../configure --prefix=/opt/glibc-2.34
  make -j$(nproc)
  make install
  echo 'export LD_LIBRARY_PATH=/opt/glibc-2.34/lib:$LD_LIBRARY_PATH' >> /root/.bashrc
else
  echo "[*] glibc 2.34 sudah terinstall."
fi

echo "[*] Setting up UFW rules"
ufw disable
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
# ufw enable  # aktifkan jika ingin hidupkan firewall sekarang
