# IDE


__apt_get_install_noinput() {
    apt-get install -y -o DPkg::Options::=--force-confold $@; return $?
}

install_gnome(){
packages="gnome-core
ubuntu-gnome-desktop"
   echo "Installing Gnome desktop packages"
   for PACKAGE in $packages; do
        __apt_get_install_noinput $PACKAGE >> $HOME/ECC-install.log 2>&1
        ERROR=$?
        if [ $ERROR -ne 0 ]; then
            echo "Install Failure: $PACKAGE (Error Code: $ERROR)"
        else
            echo "Installed Package: $PACKAGE"
        fi
    done
}


remove_unity(){
#sudo apt-get install gdm -y
#sudo apt-get install gnome-shell -y
#sudo apt-get install ubuntu-gnome-desktop -y
sudo apt-get remove unity -y
sudo apt-get remove lightdm -y 
}

install_gnome
remove_unity
