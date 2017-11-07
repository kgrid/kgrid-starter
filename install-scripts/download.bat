@echo off
echo "Downloading Additional KGrid components"

:: The Fedora Commons repo (via fcrepo4-vagrant) is preinstalled in the kgrid-starter.
:: It needs to be initialized with 'vagrant up' which called from the init script

echo "Downloading the Library (kgrid-library-0.2.4-SNAPSHOT.war)"
curl -L https://github.com/kgrid/kgrid-starter/releases/download/0.6/{kgrid-library-0.2.4-SNAPSHOT.war} --output ./library/#1

echo "Downloading the Activator (activator-0.5.8-SNAPSHOT.war)"
curl -L https://github.com/kgrid/kgrid-starter/releases/download/0.6/{activator-0.5.8-SNAPSHOT.war} --output ./activator/#1

echo "Downloading the Python adapter (python-adapter-0.5.8-SNAPSHOT-jar-with-dependencies.jar)"
curl -L https://github.com/kgrid/kgrid-starter/releases/download/0.6/{python-adapter-0.5.8-SNAPSHOT-jar-with-dependencies.jar} --output ./activator/adapters/#1

echo "Downloading the Demo Video (KGridDemoVideo.3min.720p.mov)"
curl -L https://github.com/kgrid/kgrid-starter/releases/download/0.6/{KGridDemoVideo.3min.720p.mov} --output ./video/#1

:: The cancer-advisor client is preinstalled in the kgrid-starter
