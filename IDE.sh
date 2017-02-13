install_gnome(){
sudo apt-get remove lightdm && sudo apt-get install gdm
#sudo service gdm start
sudo apt-get install gnome-shell --no-install-recommends
sudo apt-get install ubuntu-gnome-desktop
sudo apt-get remove unity
}

install_gnome
