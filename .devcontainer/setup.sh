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


echo "Parcheando desktop-init.sh para usar depth 24 por defecto..."
sudo sed -i 's/VNC_RESOLUTION=${VNC_RESOLUTION}x16/VNC_RESOLUTION=${VNC_RESOLUTION}x24/' /usr/local/share/desktop-init.sh
echo "🏗️  Configurando el proyecto CMake..."
mkdir -p build
cmake -S . -B build -G Ninja -DCMAKE_BUILD_TYPE=Debug
echo "✅ Entorno listo. Usa 'cmake --build build' para compilar."
echo "Vamos a pasar Xtigervnc a depth 24"
bash .devcontainer/setup-corrige.sh
#pkill -f "Xtigervnc :1" && tigervncserver :1 -geometry 1440x768 -depth 24 -rfbport 5901 -dpi 96 -localhost -Securitytypes None
# final