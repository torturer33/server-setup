#!/bin/bash
set -e

echo "🚀 Ubuntu Server kurulumu sonrası otomasyon başlıyor..."

# 1. Sistem güncelleme
sudo apt update && sudo apt -y upgrade

# 2. OpenSSH Server kurulumu
echo "🔑 OpenSSH kuruluyor..."
sudo apt install -y openssh-server
sudo systemctl enable --now ssh

# 3. Docker kurulumu
echo "🐳 Docker kuruluyor..."
sudo apt-get install -y ca-certificates curl gnupg lsb-release
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo usermod -aG docker $USER

# 4. Coolify kurulumu
echo "🔥 Coolify kuruluyor..."
curl -fsSL https://cdn.coollabs.io/coolify/install.sh | sudo bash

# 5. Cloudflared kurulumu
echo "🌐 Cloudflared kuruluyor..."
curl -fsSL https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb -o cloudflared.deb
sudo dpkg -i cloudflared.deb || true

echo ""
echo "✅ İşlem tamamlandı!"
echo "👉 Şimdi manuel olarak şunu çalıştırmalısın:"
echo "   cloudflared tunnel login"
