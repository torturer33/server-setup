#!/bin/bash
set -e

echo "🚀 Ubuntu Server Setup Başlıyor..."

# Sistem güncelleme
echo "🔹 Sistem güncelleniyor..."
sudo apt update && sudo apt upgrade -y

# Docker kurulumu
echo "🔹 Docker kuruluyor..."
curl -fsSL https://get.docker.com | sh

# Docker Compose Plugin kurulumu
echo "🔹 Docker Compose kuruluyor..."
sudo apt install -y docker-compose-plugin

# Kullanıcıyı docker grubuna ekle
sudo usermod -aG docker $USER

# Coolify kurulumu
echo "🔹 Coolify kuruluyor..."
docker volume create coolify-data
docker run -d --name coolify \
  --restart unless-stopped \
  -p 3000:3000 \
  -v coolify-data:/app/data \
  coollabsio/coolify:latest

# Cloudflared kurulumu
echo "🔹 Cloudflared kuruluyor..."
wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64.deb
sudo dpkg -i cloudflared-linux-amd64.deb
rm cloudflared-linux-amd64.deb

# Kurulum Testleri
echo "🔹 Kurulum testleri:"
docker --version
docker
