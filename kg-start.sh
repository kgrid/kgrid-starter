#!/bin/sh

echo "
Launching the knowledge grid... See the readme file in this directory for details on installation.
"

javaVersion=`java -version 2>&1 | sed -n 1p` #get the first line of java -version
versionRegex='.*"9".*'
if [[ $javaVersion =~ $versionRegex ]] ; then
	echo "Setting java version to 1.8"
	installedJDKs=`/usr/libexec/java_home -V 2>&1 | sed -n 3p`
	java18regex="    (1\.8\..*),"
	[[ $installedJDKs =~ $java18regex ]]
	export JAVA_HOME=$(/usr/libexec/java_home -v ${BASH_REMATCH[1]})
else
	echo "Java version OK!"
fi

cd fcrepo4-vagrant-4.5.1
	echo "
	Starting Fedora Commons repo (via fcrepo4-vagrant) on http://localhost:8080/fcrepo
	If this is the first time running the Knowledge Grid, it will take a while
	to set up the virtual machine, the Fedora repository, and the associated tools...
	"
	vagrant up
cd ..

echo "Starting library on http://localhost:8081"
java -jar library/kgrid-library-0.2.4-SNAPSHOT.war --server.port=8081 --ezid.mock=true &
# echo $! > ".pids.txt"

echo "Starting activator on http://localhost:8082"
java -jar activator/activator-0.5.8-SNAPSHOT.war --server.port=8082 --activator.home=activator --library.url=http://localhost:8081 &
# echo $! >> ".pids.txt"

# cancer advisor, needs node, npm then npm install http-server -g
echo "Starting demo server on http://localhost:8083"
http-server -p 8083 -o &
echo "Demo server started"
# echo $! >> "../.pids.txt"
