@echo off
echo "Stopping live-server"
FOR /F "tokens=5 delims= " %%P IN ('netstat -a -n -o ^| findstr :48083') DO IF %%P NEQ 0 ( taskkill /PID %%P /F)
taskkill /fi "windowtitle eq kgrid"
echo "Stopping KGRID Activator"
FOR /F "tokens=5 delims= " %%P IN ('netstat -a -n -o ^| findstr :48082') DO IF %%P NEQ 0 ( taskkill /PID %%P /F)
echo "Stopping KGRID Library"
FOR /F "tokens=5 delims= " %%P IN ('netstat -a -n -o ^| findstr :48081') DO IF %%P NEQ 0 ( taskkill /PID %%P /F)
cd fcrepo4-vagrant-4.5.1
echo "Stopping vagrant"
vagrant halt
cd ..
