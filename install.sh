#!/usr/bin/bash

echo "Welcome to the installer Python Developer Kit!"
read -n 1 -r -p "Press any key to continue..."
echo -e "\n"

echo "[INFO] Cloning git repository..."
git clone https://github.com/TheRealPchol/Python-Developer-Kit.git temp_pydk/

if [ $? -ne 0 ]; then
    echo "[ERROR] Failed to clone repository!" >&2
    exit 1
fi
echo "[OK] Cloning completed."

echo "[INFO] Preparing /opt/pydk directory..."
# Очищаем старую установку, если она была, чтобы не плодить мусор
sudo rm -rf /opt/pydk
sudo mkdir -p /opt/pydk

echo "[INFO] Moving files (including hidden git metadata)..."
# Используем . вместо * чтобы захватить скрытую папку .git
sudo cp -r temp_pydk/. /opt/pydk/

echo "[INFO] Configuring global access..."
sudo chmod +x /opt/pydk/pydk
sudo ln -sf /opt/pydk/pydk /usr/local/bin/pydk

echo "[INFO] Removing temporary installation directory..."
rm -rf temp_pydk
echo "[OK] Cleaned up."

echo -e "\nPyDK successfully installed globally!"
echo "You can now use 'pydk' from anywhere, and keep it fresh with 'pydk update'."
echo ""

pydk help
