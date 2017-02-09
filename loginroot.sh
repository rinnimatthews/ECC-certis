# Login as root
login_root(){
sudo passwd
eccouncil
echo "greeter-show-manual-login=true" >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
}
