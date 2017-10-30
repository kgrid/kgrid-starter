cd\
cd fc451
taskkill /f /fi "imagename eq cmd.exe"

echo "Stopping vagrant"
vagrant halt
exit
