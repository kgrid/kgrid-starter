

cd fcrepo4-vagrant-4.5.1
echo "Starting vargant"
vagrant up
cd ..

echo "Starting library"
START /B java -jar Library/kgrid-library-0.2.4-SNAPSHOT.war --server.port=8081 &

echo "Starting activator"
START /B java -jar Activator/activator-0.5.8-SNAPSHOT.war --server.port=8082 --activator.home=Activator --library.url=http://localhost:8081 &

echo "Starting cancer advisor"
cd cancer-advisor-0.5
START /B http-server -p 8083 &
echo "started cancer advisor"
cd ..

start "" http://localhost:8081
start "" http://localhost:8083?stack=http://localhost:8081
