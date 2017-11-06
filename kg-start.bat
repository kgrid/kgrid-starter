@echo off
cd fcrepo4-vagrant-4.5.1
echo "Starting vagrant"
vagrant up
cd..

echo "Starting library"
start /min java -jar library/kgrid-library-0.2.4-SNAPSHOT.war --server.port=8081 --ezid.mock=true --fcrepo.port=8080

echo "Starting activator"
start /min  java -jar activator/activator-0.5.8-SNAPSHOT.war --server.port=8082 --activator.home=activator --library.url=http://localhost:8081

echo "Starting web server"
echo "Welcome Page will be opened in your default browser."
echo "It may take a while for the Library and Activator to start and be ready."
start /min "Kgrid" live-server --port=8083 --host=localhost
