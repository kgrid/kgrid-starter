
REM javaVersion=`java -version 2>&1 | sed -n 1p` 
REM #get the first line of java -version
REM versionRegex='.*"9".*'
REM if [[ $javaVersion =~ $versionRegex ]] ; then
REM	echo "Setting java version to 1.8" 
REM	installedJDKs=`/usr/libexec/java_home -V 2>&1 | sed -n 3p`
REM	java18regex="    (1\.8\..*)," 
REM	[[ $installedJDKs =~ $java18regex ]]
REM	export JAVA_HOME=$(/usr/libexec/java_home -v ${BASH_REMATCH[1]})
REM else
REM	echo "Java version OK!"
REM fi

cd fcrepo4-vagrant-4.7.4
REM vagrantStatus=$(echo $(vagrant status | sed -n 3p) | cut -c8-15)
REM if [ $vagrantStatus != "running" ] ; then
	echo "Starting vargant"
	vagrant up
REM fi
cd ..

echo "Starting library"
START /B java -jar Library/kgrid-library-0.2.4-SNAPSHOT.war --server.port=8090 &
REM echo $! > ".pids.txt"

echo "Starting activator"
START /B java -jar Activator/activator-0.5.8-SNAPSHOT.war --server.port=8091 --activator.home=Activator --library.url=http://localhost:8090 &
REM echo $! >> ".pids.txt"

REM cancer advisor, needs node, npm then npm install http-server -g
echo "Starting cancer advisor"
cd cancer-advisor
START /B http-server -p 8092 &
echo "started cancer advisor"
echo $! >> "../.pids.txt"
cd ..

sleep 14
`open http://localhost:8090`
`open http://localhost:8092?stack=http://localhost:8091`

REM todo:
REM install needed objects
REM put things in fedora
