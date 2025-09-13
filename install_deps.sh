#!/bin/bash

set -e

# Определение дистрибутива
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$ID
else
    echo "Не удалось определить ОС. Файл /etc/os-release не найден."
    exit 1
fi

echo "Обнаружена ОС: $OS"

if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
    echo "Устанавливаем зависимости для Ubuntu/Debian..."
    sudo apt update && sudo apt install -y \
        cairo libfreetype6-dev libglm-dev libdrm-dev libevdev-dev libgl1-mesa-dev \
        libinput-dev libjpeg-dev libpng-dev libxkbcommon-dev libxml2-dev \
        libpixman-1-dev pkg-config wayland-protocols \
        libwf-config-dev libwlroots-dev seatd libxcb1-dev libxcb-composite0-dev \
        libxcb-render0-dev libxcb-xfixes0-dev libx11-xcb-dev libxcb-xinput-dev \
        libxcb-icccm4-dev libxcb-ewmh-dev libxcb-present-dev libxcb-res0-dev \
        libgl1-mesa-dev libgles2-mesa-dev libwayland-dev libwayland-egl1-mesa \
        libdav1d-dev \
        meson wget build-essential ninja-build cmake-extras cmake gettext \
        fontconfig libfontconfig-dev libffi-dev libxkbcommon-x11-dev \
        libxkbregistry-dev libudev-dev libseat-dev libegl1-mesa-dev \
        glslang-tools libinput-bin libavutil-dev libavcodec-dev libavformat-dev \
        libxcb-ewmh2 libtomlplusplus-dev libre2-dev

elif [[ "$OS" == "fedora" ]]; then
    echo "Устанавливаем зависимости для Fedora..."
    sudo dnf install -y \
        cairo-devel freetype-devel glm-devel libdrm-devel libevdev-devel mesa-libGL-devel \
        libinput-devel libjpeg-turbo-devel libpng-devel libxkbcommon-devel libxml2-devel \
        pixman-devel pkgconf-pkg-config wayland-protocols-devel \
        wf-config-devel wlroots-devel seatd-devel xcb-util xcb-util-renderutil-devel \
        xcb-util-wm-devel xcb-util-image-devel xcb-util-keysyms-devel \
        libX11-xcb-devel xcb-util-cursor-devel mesa-libEGL-devel mesa-libGLES-devel \
        wayland-devel wayland-egl-devel dav1d-devel \
        meson wget @development-tools ninja-build cmake cmake-data gettext fontconfig-devel \
        libffi-devel libxkbcommon-x11-devel libxkbregistry-devel systemd-devel \
        libseat-devel glslang libinput ffmpeg-libs re2-devel \
        tomlplusplus-devel
else
    echo "Неподдерживаемая ОС: $OS"
    echo "Поддерживаются только Ubuntu/Debian и Fedora."
    exit 1
fi

echo "✅ Установка зависимостей завершена."
