#!/bin/bash
# ============================================================
# deploy.sh — Dipanggil oleh webhook GitHub via aaPanel
#
# Setup di aaPanel:
#   Website → Deployment → Git → "Deployment Script":
#   bash /www/wwwroot/avd.myprabowo.my.id/deploy.sh
# ============================================================

set -e

export HOME="/root"  # diperlukan karena webhook aaPanel berjalan tanpa $HOME

QUARTO="/usr/local/bin/quarto"
WEB_ROOT="/www/wwwroot/avd.myprabowo.my.id"

echo "=========================================="
echo "Deploy dimulai: $(date)"
echo "=========================================="

# Izinkan git di direktori ini (perlu jika dijalankan sebagai www-data)
git config --global --add safe.directory "$WEB_ROOT"

# Masuk ke folder repo
cd "$WEB_ROOT"

# Ambil source terbaru dari GitHub
echo ""
echo "▶ Git pull..."
git pull origin main
echo "✅ Source terbaru diambil"

# Render Quarto ke web root
echo ""
echo "▶ Quarto render..."
$QUARTO render --output-dir "$WEB_ROOT"

echo ""
echo "🚀 Deploy selesai — https://avd.myprabowo.my.id"
echo "$(date)"
