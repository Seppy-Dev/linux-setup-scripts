#!/bin/bash

#Update all packages
sudo pacman -Syu -y

#Install packages needed for script
sudo pacman -S git git-lfs unzip -y

#Initialise Flathub
sudo pacman -S flatpak -y
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Set up yay
mkdir ~/build
cd ~/build/
git clone https://aur.archlinux.org/yay.git
cd yay/
makepkg -si --noconfirm

#Install gaming launchers
sudo pacman -S steam lutris -y
flatpak install -y --noninteractive com.heroicgameslauncher.hgl

#Install Unity
cd ~/build/
git clone https://aur.archlinux.org/unityhub.git
cd unityhub/
makepkg -si --noconfirm

#Install Godot
sudo pacman -S godot -y

#Install Unreal Engine
sleep 1 
echo "Unfortunately automating the install of Unreal Engine is rather a pain, especially if you want different versions"
sleep 1 
echo "If you want to download it manually, go here: https://www.unrealengine.com/en-US/linux"
sleep 1 
echo "Continuing..." 

#Download VS Code
cd ~/Downloads/
wget -O vscode.deb https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
sudo pacman -S ./vscode.deb -y
rm vscode.deb

#Download Github Desktop
cd ~/Build/
git clone https://aur.archlinux.org/github-desktop-bin.git
cd github-desktop-bin/
makepkg -si --noconfirm

#Install Discord & enable Vencord
flatpak install -y --noninteractive com.discordapp.Discord
read -p "Do you want to install Vencord? (y/n): " answer
if [[ "$answer" == "y" || "$answer" == "Y" ]]; then
    echo "Installing Vencord. You will need to manually select the option to install.."
    sleep 3
    sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
else
    echo "Skipping Vencord installation..."
fi

#Install Bitwarden
flatpak install -y --noninteractive com.bitwarden.desktop 

#Install Filezilla
flatpak install -y --noninteractive org.filezillaproject.Filezilla

#Install Wine
sudo pacman -S wine -y

#Script End
sleep 2
echo "Finished! Rebooting..."
sleep 3
sudo reboot