#!/usr/bin/env bash

#########################################
# Download tools needed to run Kgrid
#########################################

# Download jdk8, virtualbox, vagrant, node.js (plus npm). Then `npm install http-server`

java -version
vboxmanage -version
vagrant --version
node --version
npm view http-server version

# tell the user that they need to install jdk8, virtualbox, vagrant, node.js


#########################################
# Download Kgrid components themselves
#########################################

curl https://github.com/kgrid/kgrid-library/releases/download/0.2.4-SNAPSHOT/kgrid-library-0.2.4-SNAPSHOT.war --output ./library/library.war
# curl  [kgrid library release] --output ./activator/activator.war
