# Login as root
login_root(){
#sudo passwd
#eccouncil
#echo "eccouncil" | sudo -S
echo "greeter-show-manual-login=true" >> /usr/share/lightdm/lightdm.conf.d/50-unity-greeter.conf
}
