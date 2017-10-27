#!/bin/sh
javaVersion=`java -version 2>&1 | sed -n 1p` #get the first line of java -version
versionRegex='.*"9".*'
if [[ $javaVersion =~ $versionRegex ]] ; then
	echo "Setting java version to 1.8"
	installedJDKs=`/usr/libexec/java_home -V 2>&1 | sed -n 3p`
	java18regex="    (1\.8\..*)," 
	[[ $installedJDKs =~ $java18regex ]]
	export JAVA_HOME=$(/usr/libexec/java_home -v ${BASH_REMATCH[1]})
	javaVersion=`java -version 2>&1 | sed -n 1p`
else
  echo "Java version OK!"
fi

hasVBox=`which VBoxManage`
vBoxVersion=`VBoxManage -v`
isVersion51=`expr $vBoxVersion : '5.1'`

if [ ! -f "$hasVBox" -o  $isVersion51 -nq "0" ] ; then
	echo "No Virtual Box install found, installing"
	echo hdiutil attach Installers/VirtualBox-5.1.30-118389-OSX.dmg
	echo installer -package /Volumes/VirtualBox/VirtualBox.pkg -target /
	echo hdiutil detach /Volumes/VirtualBox
else 
 	echo "Virtual Box OK!"
fi
