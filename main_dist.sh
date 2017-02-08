# Change desktop background to EC-Council

install_desktop_background() {
echo "Transforming Desktop Background"
	CDIR=$(pwd)
	cd /tmp/
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
	vi CEH.desktop
	[Desktop Entry]
	Version=10.0
	Name=CEH       
	Comment=Certified Ethical Hacker
	Exec=/tmp/ECC-certis/link_files/CEH.sh
	Icon=/tmp/ECC-certis/Images/CEH.png
	Terminal=true
	Type=Application
	Categories=Utility;Application;
	:wq
	chmod +x CEH.desktop
}

# Remove default Icons from the Panel and setting custom icons in panel
customize_default_icons() {
gsettings set com.canonical.Unity.Launcher favorites "['nautilus-home.desktop','application://firefox.desktop', 'application://gnome-terminal.desktop','application://CEH.desktop']"}

rm -f /tmp/ECC-certis
}


# Main

echo "Welcome to EC-Council OS Suite"
install_desktop_background
creating_custom_desktop_icons
customize_default_icons

