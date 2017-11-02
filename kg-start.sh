#!/bin/sh

set -e
function cleanup {
	echo "Demo server stopped"
	echo "Shutting down the Knowledge Grid..."
	./kg-stop
	echo "Thanks, bye"
}
trap cleanup EXIT

BASEDIR=$(dirname "$0")
cd $BASEDIR


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
	Starting Fedora Commons repo (via fcrepo4-vagrant) on http://localhost:48080/fcrepo
	If this is the first time running the Knowledge Grid, it will take a while
	to set up the virtual machine, the Fedora repository, and the associated tools...
	"
	vagrant up
cd ..

echo "Starting library on http://localhost:48081"
java -jar library/kgrid-library-0.2.4-SNAPSHOT.war --server.port=48081 --ezid.mock=true --fcrepo.port=48080 &
# echo $! > ".pids.txt"

echo "Starting activator on http://localhost:48082"
java -jar activator/activator-0.5.8-SNAPSHOT.war --server.port=48082 --activator.home=activator --library.url=http://localhost:48081 &
# echo $! >> ".pids.txt"

# cancer advisor, needs node, npm then npm install live-server -g
# To force a particular browser add '--browser="google chrome"'
echo "Starting demo server on http://localhost:48083"
live-server --port=48083 --host=localhost &
echo "Demo server started"
# echo $! >> "../.pids.txt"
