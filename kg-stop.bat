cd fcrepo4-vagrant-4.5.1
echo "Stopping vagrant"
vagrant halt
cd ..
taskkill /f /fi "imagename eq cmd.exe"
