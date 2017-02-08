# Change desktop background to EC-Council

install_desktop_background() {
echo "Transforming Desktop Background"
	CDIR=$(pwd)
	cd /tmp/
	#apt-get install git
	git clone --recursive https://github.com/rinnimatthews/ECC-certis /tmp/ECC-certis >> $HOME/ECC-install.log 2>&1
cp -R /tmp/ECC-certis/Images/warty-final-ubuntu.png /usr/share/backgrounds/

#rm -f /tmp/ECC-certis

}

# Creating custom desktop icons
creating_custom_desktop_icons() {
	echo "Creating Custom desktop Icons"
	CDIR=$(pwd)
	cd /tmp/ECC-certis
	mkdir ECC-iconfiles
	cd ECC-iconfiles
	echo "Creating CEH Icon"
	echo "[Desktop Entry]" >> CEH.desktop
	echo "Version=10.0" >> CEH.desktop
	echo "Name=CEH" >> CEH.desktop
	echo "Comment=Certified Ethical Hacker" >> CEH.desktop
	echo "Exec=./tmp/ECC-certis/link_files/CEH.sh" >> CEH.desktop
	echo "Icon=/tmp/ECC-certis/Images/CEH.png" >> CEH.desktop
	echo "Terminal=true" >> CEH.desktop
	echo "Type=Application" >> CEH.desktop
	echo "Categories=Application;" >> CEH.desktop
	sudo chmod +x CEH.desktop
	cp -R /tmp/ECC-certis/ECC-iconfiles/CEH.desktop /usr/share/applications
cp -R /tmp/ECC-certis/ECC-iconfiles/CEH.desktop /home/Desktop
	sudo updatedb
	echo "CEH Icon created"
}

# Remove default Icons from the Panel and setting custom icons in panel
customize_default_icons() {
gsettings set com.canonical.Unity.Launcher favorites "['nautilus-home.desktop','application://firefox.desktop', 'application://gnome-terminal.desktop', 'application://CEH.desktop']"
}

#rm -f /tmp/ECC-certis

# Login as root
#login_root(){

#}
# Main

echo "Welcome to EC-Council OS Suite"
install_desktop_background
creating_custom_desktop_icons
customize_default_icons
#reboot

