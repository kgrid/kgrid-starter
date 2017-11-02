cd fcrepo4-vagrant-4.5.1
echo "Starting vagrant"
vagrant up
cd..

echo "Starting library"
::cd library
start /min java -jar library/kgrid-library-0.2.4-SNAPSHOT.war --server.port=8081 --ezid.mock=true
::cd..
::timeout /t 20
::cls

echo "Starting activator"
::cd activator
start /min  java -jar activator/activator-0.5.8-SNAPSHOT.war --server.port=8082 --activator.home=activator --library.url=http://localhost:8081
::cd..
::timeout /t 15

echo "Starting cancer advisor"
::cd cancer-advisor
start /min "Kgrid" http-server -p 8083 -o
