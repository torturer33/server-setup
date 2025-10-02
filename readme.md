# 🚀 Ubuntu Server Setup Script

Bu repo, **Ubuntu Server kurulumu** sonrası gerekli bileşenleri otomatik olarak kurmak için hazırlanmıştır.  
Tek satırla indirip çalıştırabilirsiniz.

## 🔹 Kurulan Bileşenler
- OpenSSH Server (uzaktan bağlantı için)
- Docker Engine (docker)
- Docker Compose Plugin (docker compose)
- Coolify (self-hosted PaaS platformu)
- Cloudflared (Cloudflare Tunnel istemcisi)

## 🔹 Kullanım

Sunucunuza giriş yaptıktan sonra aşağıdaki komutu çalıştırın:

```bash
bash <(curl -fsSL https://raw.githubusercontent.com/torturer33/server-setup/main/setup-server.sh)

Not: cloudflared tunnel login adımını script sonunda manuel çalıştırmanız gerekir. Çünkü bu işlem tarayıcı açarak Cloudflare hesabına giriş yapmanızı ister.
