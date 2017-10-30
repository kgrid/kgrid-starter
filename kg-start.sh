#!/bin/sh
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
	echo "Starting vagrant"
	vagrant up
cd ..

echo "Starting library"
java -jar library/kgrid-library-0.2.4-SNAPSHOT.war --server.port=8081 &
echo $! > ".pids.txt"

echo "Starting activator"
java -jar activator/activator-0.5.8-SNAPSHOT.war --server.port=8082 --activator.home=activator --library.url=http://localhost:8081 &
echo $! >> ".pids.txt"

# cancer advisor, needs node, npm then npm install http-server -g
echo "Starting cancer advisor"
cd cancer-advisor
http-server -p 8083 &
echo "started cancer advisor"
echo $! >> "../.pids.txt"
cd ..

sleep 14
`open http://localhost:8081`
`open http://localhost:8083?stack=http://localhost:8082`

# todo:
# install needed objects
# put things in fedora
