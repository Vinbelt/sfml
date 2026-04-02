#!/bin/bash
set -ex

LOG="/home/vscode/vnc-loop.log"

echo "Inicio del script segunda parte: $(date)" >> "$LOG"
echo "🔴 Matando procesos VNC anteriores..." >> "$LOG"

# Matar posibles watchdogs antiguos lanzados con bash -c
pkill -f "rfbport 5901" 2>/dev/null || true
pkill -f "ss -tuln | grep -q \":5901\"" 2>/dev/null || true

# Matar VNC real
pkill -f Xtigervnc 2>/dev/null || true
pkill -f "/usr/bin/perl /usr/bin/tigervncserver :1" 2>/dev/null || true
pkill -f "tigervncserver :1" 2>/dev/null || true

# Limpiar locks
rm -f /tmp/.X1-lock /tmp/.X11-unix/X1 2>/dev/null || true

sleep 2

echo "🟢 Arrancando watchdog VNC con depth 24..." >> "$LOG"

nohup bash -c "
echo '[ '\"\$(date)\"' ] watchdog arrancado con PID' \$\$ >> '$LOG'

while :; do
  if ! ss -tuln | grep -q ':5901'; then
    echo '[ '\"\$(date)\"' ] VNC NO está activo -> arrancando...' >> '$LOG'
    tigervncserver :1 \
      -geometry 1440x768 \
      -depth 24 \
      -rfbport 5901 \
      -dpi 96 \
      -localhost \
      -SecurityTypes None >> '$LOG' 2>&1
    echo '[ '\"\$(date)\"' ] tigervncserver terminó con código' \$? >> '$LOG'
  fi
  sleep 5
done
" >/home/vscode/vnc-loop.log 2>&1 &

echo "He lanzado nohup: $(date)" >> "$LOG"
echo "✅ VNC lanzado en background" >> "$LOG"