cd fcrepo4-vagrant-4.5.1
echo "Starting vagrant"
vagrant up
cd..

echo "Starting library"
cd library
start /b java -jar kgrid-library-0.2.4-SNAPSHOT.war --server.port=8081 &
cd..
timeout /t 20
cls

echo "Starting activator"
cd activator
start /b  java -jar activator-0.5.8-SNAPSHOT.war --server.port=8082 --activator.home=activator --library.url=http://localhost:8081 &
cd..
timeout /t 15

echo "Starting cancer advisor"
cd cancer-advisor
start /b "Kgrid" http-server -p 8083 -o
