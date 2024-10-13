#!/bin/bash

#Update all packages
sudo apt update -y && sudo apt upgrade -y

#Install packages needed for script
sudo apt install unzip -y

#Install NVIDIA Drivers
sudo ubuntu-drivers install

#Initialise Flathub
sudo apt install flatpak
sudo apt install gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Install git & git-lfs
sudo apt install git git-lfs -y

#Install gaming launchers
sudo apt install steam lutris -y
flatpak install -y --noninteractive com.heroicgameslauncher.hgl

#Install Unity
wget -qO - https://hub.unity3d.com/linux/keys/public | gpg --dearmor | sudo tee /usr/share/keyrings/Unity_Technologies_ApS.gpg > /dev/null
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/Unity_Technologies_ApS.gpg] https://hub.unity3d.com/linux/repos/deb stable main" > /etc/apt/sources.list.d/unityhub.list'
sudo apt update -y
sudo apt install unityhub -y

#Install Godot
mkdir ~/apps
cd ~/apps/
wget -O godot.zip https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_mono_linux_x86_64.zip
unzip godot.zip
rm godot.zip

#Install Unreal Engine
sleep(1)
print("Unfortunately automating the install of Unreal Engine is rather a pain, especially if you want different versions")
sleep(1)
print("If you want to download it manually, go here: https://www.unrealengine.com/en-US/linux")
sleep(1)
print("Continuing...")

#Download VS Code
cd ~/Downloads/
wget -O vscode.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo apt install ./vscode.deb -y
rm vscode.deb

#Download Github Desktop
wget -qO - https://apt.packages.shiftkey.dev/gpg.key | gpg --dearmor | sudo tee /usr/share/keyrings/shiftkey-packages.gpg > /dev/null
sudo apt update && sudo apt install github-desktop

#Install Discord & enable Vencord
flatpak install -y --noninteractive com.discordapp.Discord
read -p "Do you want to install Vencord? (y/n): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Installing Vencord. You will need to manually select the option to install.."
    sleep(3)
    sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
else
    echo "Skipping Vencord installation..."
fi

#Install Bitwarden
flatpak install -y --noninteractive com.bitwarden.desktop 

#Install Filezilla
flatpak install -y --noninteractive org.filezillaproject.Filezilla

#Install Wine
sudo apt install wine -y

#Script End
sleep (2)
print("Finished! Rebooting...")
sleep(3)
sudo reboot