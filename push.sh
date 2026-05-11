#!/bin/bash
# ============================================================
# push.sh — Jalankan di Mac lokal
#
# Cara pakai:
#   ./push.sh "pesan commit"
#
# Apa yang terjadi setelah push:
#   GitHub → webhook → aaPanel render → avd.myprabowo.my.id
#
# Untuk publish ke Quarto Pub (opsional, jalankan terpisah):
#   /Applications/RStudio.app/Contents/Resources/app/quarto/bin/quarto \
#     publish quarto-pub --no-browser --no-prompt
# ============================================================

set -e

COMMIT_MSG="${1:-Update konten}"

echo ""
echo "▶ Git push ke GitHub..."
git add .
git commit -m "$COMMIT_MSG" 2>/dev/null || echo "   (Tidak ada perubahan baru untuk di-commit)"
git push origin main
echo "✅ Push selesai — webhook aaPanel akan otomatis merender."
