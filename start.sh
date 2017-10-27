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
vagrantStatus=$(echo $(vagrant status | sed -n 3p) | cut -c8-15)
if [ $vagrantStatus != "running" ] ; then
	echo "Starting vargant"
	vagrant up
fi
cd ..

echo "Starting library"
java -jar Library/kgrid-library-0.2.4-SNAPSHOT.war --server.port=8090 &
echo $! > ".pids.txt"

echo "Starting activator"
java -jar Activator/activator-0.5.8-SNAPSHOT.war --server.port=8091 --activator.home=Activator --library.url=http://localhost:8090 &
echo $! >> ".pids.txt"

# cancer advisor, needs node, npm then npm install http-server -g
echo "Starting cancer advisor"
cd cancer-advisor
http-server -p 8092 &
echo "started cancer advisor"
echo $! >> "../.pids.txt"
cd ..

sleep 14
`open http://localhost:8090`
`open http://localhost:8092?stack=http://localhost:8091`

# todo:
# install needed objects
# put things in fedora
