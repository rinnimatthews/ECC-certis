# Change desktop background to EC-Council

install_desktop_background() {
echo "Transforming Desktop Background"
	CDIR=$(pwd)
	cd /home/
	#apt-get install git
	git clone --recursive https://github.com/rinnimatthews/ECC-certis /home/ECC-certis >> $HOME/ECC-install.log 2>&1
sudo chmod 777 /home/ECC-certis/
sudo chmod 777 /home/ECC-certis/Images
sudo chmod 777 /home/ECC-certis/link_files
sudo chmod 777 /home/ECC-certis/link_files/CEH.sh
sudo chmod 777 /home/ECC-certis/link_files/CND.sh
sudo chmod 777 /home/ECC-certis/link_files/CHFI.sh
cp -R /home/ECC-certis/Images/warty-final-ubuntu.png /usr/share/backgrounds/

#rm -f /home/ECC-certis

}

# Creating custom desktop icons
creating_custom_desktop_icons() {
	echo "Creating Custom desktop Icons"
	CDIR=$(pwd)
	cd /home/ECC-certis
	sudo mkdir -p /home/ECC-certis/ECC-iconfiles
	sudo chmod 777 /home/ECC-certis/ECC-iconfiles
	cd ECC-iconfiles
	echo "Creating CEH Icon"
	echo "[Desktop Entry]" >> CEH.desktop
	echo "Version=10.0" >> CEH.desktop
	echo "Name=CEH" >> CEH.desktop
	echo "Comment=Certified Ethical Hacker" >> CEH.desktop
	echo "Exec=/home/ECC-certis/link_files/CEH.sh" >> CEH.desktop
	echo "Icon=/home/ECC-certis/Images/CEH.png" >> CEH.desktop
	echo "Terminal=true" >> CEH.desktop
	echo "Type=Application" >> CEH.desktop
	echo "Categories=Application" >> CEH.desktop
	sudo chmod +x /home/ECC-certis/ECC-iconfiles/CEH.desktop
	sudo chmod 777 /home/ECC-certis/ECC-iconfiles/CEH.desktop
	cp -R /home/ECC-certis/ECC-iconfiles/CEH.desktop /usr/share/applications/CEH.desktop
	sudo chmod 777 /usr/share/applications/CEH.desktop
	#cp -R /usr/share/applications/CEH.desktop /home/eccounciltest/Desktop/CEH.desktop
	#sudo chmod 777 /home/eccounciltest/Desktop/CEH.desktop
	#sudo updatedb
	echo "CEH Icon created"
}

# Remove default Icons from the Panel and setting custom icons in panel
customize_default_icons() {
echo "Replacing default panel icons"
sudo gsettings set com.canonical.Unity.Launcher favorites "['application://CEH.desktop', 'application://gnome-terminal.desktop', 'nautilus-home.desktop','application://firefox.desktop']"
echo "default panel icons replaced"
}

#rm -f /home/ECC-certis

# Login as root
#login_root(){

#}
# Main

echo "Welcome to EC-Council OS Suite"
install_desktop_background
creating_custom_desktop_icons
customize_default_icons
reboot

