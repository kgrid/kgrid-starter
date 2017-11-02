#!/usr/bin/env bash

#########################################
# Download tools needed to run Kgrid
#########################################

echo "
The following tools are required for running the Knowledge grid:

JDK 8
VirtualBox
Vagrant
Node.js (with NPM and the 'live-server' package)

See the readme.html in this directory for details.
"


#########################################
# Download Kgrid components themselves
#########################################

# The Fedora Commons repo (via fcrepo4-vagrant) is preinstalled in the kgrid-starter.
# It needs to be initialized with 'vagrant up' which called from the init script

echo "Downloading the Library (kgrid-library-0.2.4-SNAPSHOT.war)"
curl -L https://github.com/kgrid/kgrid-starter/releases/download/0.6/{kgrid-library-0.2.4-SNAPSHOT.war} --output ./library/#1

echo "Downloading the Activator (activator-0.5.8-SNAPSHOT.war)"
curl -L https://github.com/kgrid/kgrid-starter/releases/download/0.6/{activator-0.5.8-SNAPSHOT.war} --output ./activator/#1

echo "Downloading the Python adapter (python-adapter-0.5.8-SNAPSHOT-jar-with-dependencies.jar)"
curl -L https://github.com/kgrid/kgrid-starter/releases/download/0.6/{python-adapter-0.5.8-SNAPSHOT-jar-with-dependencies.jar} --output ./activator/adapters/#1

echo "
Finished downloading.... If there were errors see the setup guide,
check that you are connected to the internet, and try again.
"

# The cancer-advisor client is preinstalled in the kgrid-starter
