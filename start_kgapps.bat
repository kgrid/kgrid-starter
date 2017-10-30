cd\
echo "Starting library"
cd kgridrepo/kgrid-library
start /b java -jar target/kgrid-library-0.2.4-SNAPSHOT.war --server.port=8081 &
cd\
timeout /t 10

echo "Starting activator"
cd kgrid/activator
start /b  java -jar activator-0.5.8-SNAPSHOT.war --server.port=8082 --library.url=http://localhost:8081 &
cd\
timeout /t 10

echo "Starting cancer advisor"
cd kgridrepo\cancer-advisor
start /b http-server -p 8083
:: echo "started cancer advisor"

 timeout /t 20

 start "KGRID" http://localhost:8081/index.html
 start "KGRID" http://localhost:8083/index.html?stack=http://localhost:8082
