#!/usr/bin/env bash

#########################################
# Download tools needed to run Kgrid
#########################################

echo "
The following tools are required for running the Knowledge grid:

JDK 8
VirtualBox
Vagrant
Node.js (with NPM and the 'http-server' package)

Here's what we found:
"

java -version 2>&1 | grep Runtime
echo "VirtualBox: `vboxmanage -version`"
vagrant --version
echo "Node.js: `node --version`"
echo "http-server: `npm list -g http-server version | grep 'http-server'`"

# tell the user that they need to install jdk8, virtualbox, vagrant, node.js
echo "
Please note any missing tools and install them for your environment.

See the readme.html in this directory for details.
"


#########################################
# Download Kgrid components themselves
#########################################

# The Fedora Commons repo (via fcrepo4-vagrant) is preinstalled in the kgrid-starter.
# It needs to be initialized with 'vagrant up' which called from the init script


curl -L https://github.com/kgrid/kgrid-library/releases/download/0.2.4-SNAPSHOT/{kgrid-library-0.2.4-SNAPSHOT.war} --output ../library/#1 --silent
curl -L https://github.com/kgrid/kgrid-activator/releases/download/kgrid-activator-0.5.8-SNAPSHOT/{activator-0.5.8-SNAPSHOT.war} --output ../activator/#1 --silent
curl -L https://github.com/kgrid/python-adapter/releases/download/0.5.8-SNAPSHOT/{python-adapter-0.5.8-SNAPSHOT-jar-with-dependencies.jar} --output ../activator/adapters/#1 --silent

# The cancer-advisor client is preinstalled in the kgrid-starter

# Install the node http-server package

npm install http-server -g
