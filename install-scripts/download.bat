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

See the readme.html in this directory for details.
"


#########################################
# Download Kgrid components themselves
#########################################

# The Fedora Commons repo (via fcrepo4-vagrant) is preinstalled in the kgrid-starter.
# It needs to be initialized with 'vagrant up' which called from the init script


curl -L https://github.com/kgrid/kgrid-starter/releases/download/0.5/{kgrid-library-0.2.4-SNAPSHOT.war} --output ./library/#1
curl -L https://github.com/kgrid/kgrid-activator/releases/download/0.5.8-SNAPSHOT/{activator-0.5.8-SNAPSHOT.war} --output ./activator/#1
curl -L https://github.com/kgrid/python-adapter/releases/download/0.5.8-SNAPSHOT/{python-adapter-0.5.8-SNAPSHOT-jar-with-dependencies.jar} --output ./activator/adapters/#1

# The cancer-advisor client is preinstalled in the kgrid-starter
