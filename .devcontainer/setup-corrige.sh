#!/bin/bash
set -e

echo "🔴 Matando procesos VNC anteriores..."

# Matar bucle while que relanza VNC
pkill -f "while :; do.*tigervncserver :1" 2>/dev/null || true

# Matar procesos VNC directos
pkill -f Xtigervnc 2>/dev/null || true
pkill -f "/usr/bin/perl /usr/bin/tigervncserver :1" 2>/dev/null || true

# Limpiar locks (muy importante)
rm -f /tmp/.X1-lock /tmp/.X11-unix/X1 2>/dev/null || true

echo "🟢 Arrancando VNC con depth 24..."

nohup bash -c '
while :; do
  echo "[ $(date) ] VNC arrancando..."
  tigervncserver :1 \
    -geometry 1440x768 \
    -depth 24 \
    -rfbport 5901 \
    -dpi 96 \
    -localhost \
    -desktop fluxbox \
    -fg \
    -SecurityTypes None
  echo "[ $(date) ] VNC se ha cerrado. Reiniciando en 5s..."
  sleep 5
done' >/home/vscode/.vnc-loop.log 2>&1 &

echo "✅ VNC lanzado en background"