@echo off
echo "Stopping http-server"
FOR /F "tokens=5 delims= " %%P IN ('netstat -a -n -o ^| findstr :8083') DO IF %%P NEQ 0 ( taskkill /PID %%P /F)
taskkill /fi "windowtitle eq kgrid" 
echo "Stopping KGRID Activator"
FOR /F "tokens=5 delims= " %%P IN ('netstat -a -n -o ^| findstr :8082') DO IF %%P NEQ 0 ( taskkill /PID %%P /F)
echo "Stopping KGRID Library"
FOR /F "tokens=5 delims= " %%P IN ('netstat -a -n -o ^| findstr :8081') DO IF %%P NEQ 0 ( taskkill /PID %%P /F)
cd fcrepo4-vagrant-4.5.1
echo "Stopping vagrant"
vagrant halt
cd ..
