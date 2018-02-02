# Change desktop background to EC-Council

install_desktop_background() {
echo "Transforming Desktop Background"
	CDIR=$(pwd)
	cd /home/
	apt-get install git
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

creating_CEH_icon(){
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
echo "CEH Icon created"
}

creating_CND_icon(){
echo "Creating CND Icon"
	echo "[Desktop Entry]" >> CND.desktop
	echo "Version=10.0" >> CND.desktop
	echo "Name=CND" >> CND.desktop
	echo "Comment=Certified Network Defender" >> CND.desktop
	echo "Exec=/home/ECC-certis/link_files/CND.sh" >> CND.desktop
	echo "Icon=/home/ECC-certis/Images/CND.png" >> CND.desktop
	echo "Terminal=true" >> CND.desktop
	echo "Type=Application" >> CND.desktop
	echo "Categories=Application" >> CND.desktop
	sudo chmod +x /home/ECC-certis/ECC-iconfiles/CND.desktop
	sudo chmod 777 /home/ECC-certis/ECC-iconfiles/CND.desktop
	cp -R /home/ECC-certis/ECC-iconfiles/CND.desktop /usr/share/applications/CND.desktop
	sudo chmod 777 /usr/share/applications/CND.desktop
echo "CND Icon created"
}

creating_CHFI_icon(){
echo "Creating CHFI Icon"
	echo "[Desktop Entry]" >> CHFI.desktop
	echo "Version=10.0" >> CHFI.desktop
	echo "Name=CHFI" >> CHFI.desktop
	echo "Comment=Certified Hacking Forensics Investigator" >> CHFI.desktop
	echo "Exec=/home/ECC-certis/link_files/CHFI.sh" >> CHFI.desktop
	echo "Icon=/home/ECC-certis/Images/CHFI.png" >> CHFI.desktop
	echo "Terminal=true" >> CHFI.desktop
	echo "Type=Application" >> CHFI.desktop
	echo "Categories=Application" >> CHFI.desktop
	sudo chmod +x /home/ECC-certis/ECC-iconfiles/CHFI.desktop
	sudo chmod 777 /home/ECC-certis/ECC-iconfiles/CHFI.desktop
	cp -R /home/ECC-certis/ECC-iconfiles/CHFI.desktop /usr/share/applications/CHFI.desktop
	sudo chmod 777 /usr/share/applications/CHFI.desktop
echo "CHFI Icon created"
}



# Creating custom desktop icons
creating_custom_desktop_icons() {
	echo "Creating Custom desktop Icons"
	CDIR=$(pwd)
	cd /home/ECC-certis
	sudo mkdir -p /home/ECC-certis/ECC-iconfiles
	sudo chmod 777 /home/ECC-certis/ECC-iconfiles
	cd ECC-iconfiles
	creating_CEH_icon
	creating_CND_icon
	creating_CHFI_icon
}

# Remove default Icons from the Panel and setting custom icons in panel
customize_default_icons() {
echo "Replacing default panel icons"
sudo gsettings set com.canonical.Unity.Launcher favorites "['application://CEH.desktop','application://CND.desktop','application://CHFI.desktop','application://firefox.desktop','application://gnome-terminal.desktop','nautilus-home.desktop']"
echo "default panel icons replaced"
}

# Login as root
#login_root(){
#sudo passwd
#eccouncil
#echo "greeter-show-manual-login=true" >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
}


# Main

echo "Welcome to EC-Council OS Suite"
install_desktop_background
creating_custom_desktop_icons
customize_default_icons
#login_root
#rm -f /home/ECC-certis
reboot

