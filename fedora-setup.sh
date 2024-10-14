#!/bin/bash

#Update all packages
sudo dnf update -y

#Install packages needed for script
sudo dnf install unzip -y

#Install RPM Fusion
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Install NVIDIA Drivers
sudo dnf install akmod-nvidia -y

#Initialise Flathub
flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

#Update all packages (again)
sudo dnf update -y

#Install git & git-lfs
sudo dnf install git git-lfs -y

#Install gaming launchers
sudo dnf install steam lutris -y
flatpak install -y --noninteractive com.heroicgameslauncher.hgl

#Install Unity
sudo sh -c 'echo -e "[unityhub]\nname=Unity Hub\nbaseurl=https://hub.unity3d.com/linux/repos/rpm/stable\nenabled=1\ngpgcheck=1\ngpgkey=https://hub.unity3d.com/linux/repos/rpm/stable/repodata/repomd.xml.key\nrepo_gpgcheck=1" > /etc/yum.repos.d/unityhub.repo'
sudo dnf update -y
sudo dnf install unityhub -y

#Install Godot
mkdir ~/apps
cd ~/apps/
wget -O godot.zip https://github.com/godotengine/godot/releases/download/4.3-stable/Godot_v4.3-stable_mono_linux_x86_64.zip
unzip godot.zip
rm godot.zip

#Install Unreal Engine
sleep 1
echo "Unfortunately automating the install of Unreal Engine is rather a pain, especially if you want different versions"
sleep 1
echo "If you want to download it manually, go here: https://www.unrealengine.com/en-US/linux"
sleep 1
echo "Continuing..."

#Download VS Code
cd ~/Downloads/
wget -O vscode.rpm https://code.visualstudio.com/sha/download?build=stable&os=linux-rpm-x64
sudo dnf install ./vscode.rpm -y
rm vscode.rpm

#Download Github Desktop
wget -O githubdesktop.rpm https://github.com/shiftkey/desktop/releases/download/release-3.4.3-linux1/GitHubDesktop-linux-x86_64-3.4.3-linux1.rpm
sudo dnf install ./githubdesktop.rpm -y
rm githubdesktop.rpm

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
sudo dnf install wine -y

#Script End
sleep 2
echo "Finished! Rebooting..."
sleep 3
sudo reboot