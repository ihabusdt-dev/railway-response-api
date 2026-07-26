#!/bin/sh
set -e

echo "Starting application..."
chmod +x ./tiny/ffmpeg || true

exec python3 hun.py