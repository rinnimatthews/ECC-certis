__apt_get_install_noinput() {
    apt-get install -y -o DPkg::Options::=--force-confold $@; return $?
}

__apt_get_remove_noinput() {
#    apt-get remove -y -o DPkg::Options::=--force-confold $@; return $?
    apt-get remove -y -o DPkg::Options::=--force-confold $@; return $?
}

remove_unity(){
packages="unity
lightdm"
   echo "Removing Unity packages"
   for PACKAGE in $packages; do
       __apt_get_remove_noinput $PACKAGE >> $HOME/ECC-install.log #2>&1
       ERROR=$?
       if [ $ERROR -ne 0 ]; then
           echo "Remove Failure: $PACKAGE (Error Code: $ERROR)"
       else
           echo "Removed Package: $PACKAGE"
       fi
   done
echo "Unity packages Removed"
}

install_gnome(){
packages="gdm
gnome-shell
ubuntu-gnome-desktop"
   echo "Installing Gnome packages"
   for PACKAGE in $packages; do
       __apt_get_install_noinput $PACKAGE >> $HOME/ECC-install.log #2>&1
       ERROR=$?
       if [ $ERROR -ne 0 ]; then
           echo "Install Failure: $PACKAGE (Error Code: $ERROR)"
       else
           echo "Installed Package: $PACKAGE"
       fi
   done
   echo "Gnome packages Installed"
}



#install_gnome(){
#sudo apt-get remove lightdm -y && sudo apt-get install gdm -y
#sudo service gdm start
#sudo apt-get install gnome-shell -y
#sudo apt-get install ubuntu-gnome-desktop -y
#sudo apt-get remove unity -y
#}

remove_unity
install_gnome

