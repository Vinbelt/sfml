#!/bin/bash
set -e

echo "🔧 Instalando dependencias del sistema..."
sudo apt-get update -y
sudo apt-get install -y \
    libsfml-dev \
    cmake \
    build-essential \
    ninja-build \
    gdb \
    xvfb \
    x11-utils \
    libx11-dev \
    libxrandr-dev \
    libxcursor-dev \
    libudev-dev \
    libgl1-mesa-dev \
    libfreetype-dev \
    libopenal-dev \
    libflac-dev \
    libvorbis-dev

echo "✅ SFML y dependencias instaladas correctamente."
dpkg -s libsfml-dev | grep Version || true

echo "🏗️  Configurando el proyecto CMake..."
mkdir -p build
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug
echo "✅ Entorno listo. Usa 'cmake --build build' para compilar."

pkill -f "tigervncserver :1" || true
pkill -f "Xtigervnc :1" || true

nohup bash -c 'while :; do
  echo [$(date)] Process started.
  tigervncserver :1 -geometry 1440x768 -depth 24 -rfbport 5901 -dpi 96 -localhost -desktop fluxbox -fg -SecurityTypes None
  echo [$(date)] Process exited!
  sleep 5
done' >/home/vscode/.vnc-loop.log 2>&1 &



echo "🔧 Instalando dependencias del sistema..."
sudo apt-get update -y
sudo apt-get install -y \
    libsfml-dev \
    cmake \
    build-essential \
    ninja-build \
    gdb \
    xvfb \
    x11-utils \
    libx11-dev \
    libxrandr-dev \
    libxcursor-dev \
    libudev-dev \
    libgl1-mesa-dev \
    libfreetype-dev \
    libopenal-dev \
    libflac-dev \
    libvorbis-dev


    # Clonar y compilar SFML 3
git clone --depth 1 --branch 3.0.0 https://github.com/SFML/SFML.git /tmp/SFML
cmake -S /tmp/SFML -B /tmp/SFML/build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local
cmake --build /tmp/SFML/build --parallel
sudo cmake --install /tmp/SFML/build




    "postStartCommand": "bash -lc 'tigervncserver -kill :1 >/dev/null 2>&1 || true ; rm -f /tmp/.X1-lock /tmp/.X11-unix/X1 2>/dev/null || true ; tigervncserver :1 -geometry 1440x768 -depth 24 -rfbport 5901 -dpi 96 -localhost -SecurityTypes None'",
