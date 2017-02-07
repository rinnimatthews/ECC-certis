# Change desktop background to EC-Council
install_desktop_background() {
echo "Transforming Desktop Background"
	CDIR=$(pwd)
	git clone --recursive https://github.com/rinnimatthews/ECC-certis /tmp/ECC-certis >> $HOME/ECC-install.log 2>&1

#cd /tmp/ECC-certis/Images
cp -R /tmp/ECC-certis/Images/warty-final-ubuntu.png /usr/share/backgrounds/

#rm -f /tmp/ECC-certis

}

# Remove default Icons from the Panel
#remove_default_icons() {


#}

# Create Custom Icons and add Icons to the desktop Panel
#add_ECC_icons() {


#}


# Main

echo "Welcome to EC-Council OS Suite"
install_desktop_background
#remove_default_icons
#add_ECC_icons

