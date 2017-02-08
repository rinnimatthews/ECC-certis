# Change desktop background to EC-Council

install_desktop_background() {
echo "Transforming Desktop Background"
	CDIR=$(pwd)
	cd /tmp/
	#apt-get install git
	git clone --recursive https://github.com/rinnimatthews/ECC-certis /tmp/ECC-certis >> $HOME/ECC-install.log 2>&1
sudo -i cp -R /tmp/ECC-certis/Images/warty-final-ubuntu.png /usr/share/backgrounds/

#rm -f /tmp/ECC-certis

}

# Creating custom desktop icons
creating_custom_desktop_icons() {
	echo "Creating Custom desktop Icons"
	CDIR=$(pwd)
	cd /tmp/ECC-certis
	sudo -i mkdir ECC-iconfiles
	sudo -i cd ECC-iconfiles
	echo "Creating CEH Icon"
	sudo -i echo "[Desktop Entry]" >> CEH.desktop
	sudo -i echo "Version=10.0" >> CEH.desktop
	sudo -i echo "Name=CEH" >> CEH.desktop
	sudo -i echo "Comment=Certified Ethical Hacker" >> CEH.desktop
	sudo -i echo "Exec=/tmp/ECC-certis/link_files/CEH.sh" >> CEH.desktop
	sudo -i echo "Icon=/tmp/ECC-certis/Images/CEH.png" >> CEH.desktop
	sudo -i echo "Terminal=true" >> CEH.desktop
	sudo -i echo "Type=Application" >> CEH.desktop
	sudo -i echo "Categories=Application" >> CEH.desktop
	sudo -i chmod +x CEH.desktop
	sudo -i cp -R /home/eccounciltest/Documents/ECC-certis/ECC-iconfiles/CEH.desktop /usr/share/applications/CEH.desktop
	sudo -i cp -R /home/eccounciltest/Documents/ECC-certis/ECC-iconfiles/CEH.desktop /home/eccounciltest/Desktop/CEH.desktop
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

