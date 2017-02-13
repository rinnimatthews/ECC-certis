install_gnome(){
sudo apt-get remove lightdm -y && sudo apt-get install gdm -y
#sudo service gdm start
sudo apt-get install gnome-shell -y
sudo apt-get install ubuntu-gnome-desktop -y
sudo apt-get remove unity -y
}

install_gnome
