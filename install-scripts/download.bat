@echo off
echo "Downloading Additional KGrid components"

:: The Fedora Commons repo (via fcrepo4-vagrant) is preinstalled in the kgrid-starter.
:: It needs to be initialized with 'vagrant up' which called from the init script

curl -L https://github.com/kgrid/kgrid-starter/releases/download/0.6/{kgrid-library-0.2.4-SNAPSHOT.war} --output ./library/#1
curl -L https://github.com/kgrid/kgrid-starter/releases/download/0.6/{activator-0.5.8-SNAPSHOT.war} --output ./activator/#1
curl -L https://github.com/kgrid/kgrid-starter/releases/download/0.6/{python-adapter-0.5.8-SNAPSHOT-jar-with-dependencies.jar} --output ./activator/adapters/#1

:: The cancer-advisor client is preinstalled in the kgrid-starter
