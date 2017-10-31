## Knowledge Grid Starter Installation and Set Up Guide


If you haven't done so, download the kgrid-starter from the [Kgrid Starter release page](https://github.com/kgrid/kgrid-starter/releases). Choose the latest version. Download and unzip (to the Desktop for example). A folder with a name like `kgrid-starter-0.5` will be created. Change to that folder.

Or, if you have a starter kit drive, the kit is aleardy unzipped into the folder.

To install and set up the starter kit, it is preferred to have intermediate skills with the system and using the command line.

### Section 1. Prepare your system

To set up and run Knowledge Grid from your local machine, the system should have the following required software:

- [Java SE Development Kit 8](http://www.oracle.com/technetwork/pt/java/javase/downloads/jdk8-downloads-2133151.html)
- [Oracle VirtualBox 5.1](https://www.virtualbox.org/wiki/Download_Old_Builds_5_1) - Note get VirtualBox version 5.1 which is compatible with Vagrant.
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [Node.js + npm](https://www.npmjs.com/get-npm) - Note: get the long-term release version.
- After installing Node.js and `npm`, install the demo server (to run client apps) using:  
  `npm install -g http-server`

Note: If you are using a Windows system, you will need to download and install cURL at [cURL Download Page](http://www.confusedbycode.com/curl)

### Section 2. Download KGRID Components and Provision

The starter includes or sets up the following KGRID Components:

#### Components already installed with the kgrid-starter

- [Fedora Commons - Fedora 4 Vagrant Virtual Machine](https://github.com/kgrid/fcrepo4-vagrant/releases) preinstalled in the folder of `\fcrepo4-vagrant-4.5.1`
- [Knowledge Grid Starter Client App (Cancer Advisor)](https://github.com/kgrid/cancer-advisor/releases) pre-installed in the folder of `\cancer-advisor-0.5`
- [Knowledge Grid Starter Sample Knowledge Objects](KO Pack links) in the folder of `\activator\shelf`

#### Components to be downloaded and saved in the designated folders.

To download the needed components, open a terminal and entering the commands to run the `download` script in the `install_scripts`:

```bash
  cd /[path to kgrid_starter]/kgrid-starter-0.5
  ./install-scripts/download.sh     # Use download.bat in Windows
```

Or, to download manually, use the follwoing links and save the fiels into the designated folders:

- [Knowledge Grid Library](https://github.com/kgrid/kgrid-library/releases) in the folder of `\library`
- [Knowledge Grid Activator](https://github.com/kgrid/kgrid-activator/releases) in the folder of `\activator`
- [Knowledge Grid Python Adapter](https://github.com/kgrid/python-adapter/releases) in the folder of `\activator\adapters`

Now, everything is ready. Next step: Start the Knowledge Grid and initialize the repo.


### Section 3. Griddy Up and Run!

#### Initialize the Fedora repo and the library (first time)

The first time the Fedora repo is started (via `kg-start.sh`) there is a lengthy provisioning process (one time only). Also, knowledge objects need to be added to the library using the `init.sh` script (the Activator is pre-loaded).

```bash
cd /[path to kgrid_starter]/kgrid-starter-0.5
./kg-start.sh   # Use kg-start.bat for Windows
                # This will take a while, also starts the Library  
./install-scripts/init.sh # This loads objects in the library
```

__The Library, Activator, and Cancer Advisor client should be running!__

Browser windows should be launched for the Library and the Cancer Advisor. You can also navigate to:

- localhost:8081/health to see the status of the library
- localhost:8080/fcrepo/rest (fedoraAdmin:secret3) to see the fedora repo running
- localhost:8082/shelf to see objects loaded in the Activator


#### Starting and stopping the Knowledge Grid

Run the start script in the root of Knowledge Grid Starter Kit (e.g. `kgrid-starter-0.5`):

  ```bash
  cd /[path to kgrid_starter]/kgrid-starter-0.5
  ./kg-start.sh   # Use kg-start.bat in Windows
  ```

  This will start:

  - the Fedora vagrant virtual machine on `localhost:8080`;
  - Knowledge Grid Library service at `localhost:8081`;
  - Knowledge Grid Activator at `localhost:8082`;
  - A HTTP server (via `http-server`) on `localhost:8083`, hosting the Cancer Advisor at `/cancer-advisor-0.5`

And it will launch a welcome page in the browser, which contains the links to Knowledge Grid Library Web App, the Cancer Advisor and other useful resources.


---

### Appendix A - File structure
A typical file structure for the Knowledge Grid Starter Kit will look like this:

```
├── fcrepo4-vagrant-4.5.1
├── library
│   └── kgrid-library-0.2.4-SNAPSHOT.war
├── activator
│   ├── adapters
│   │   └── python-adapter-0.5.8-SNAPSHOT-jar-with-dependencies.jar
│   ├── shelf
│   │   ├── 99999-fk4571p57h
│   │   ├── 99999-fk4n87hh26
│   │   ├── ...
│   │   ├── ...
│   │   └── 99999-fk4805c32z
│   └── activator-0.5.8-SNAPSHOT.war
├── install-scripts
│   ├── download.sh
│   ├── init.sh
├── cancer-advisor-0.5
│   ├── css
│   ├── js
│   ├── data
│   └── index.html
├── readme.md
├── readme.html
├── kg-restart.sh
├── kg-stop.sh
└── kg-start.sh
```


### Appendix B - Convert MD file to HTML file

A node.js module `markdown-html` can be used to convert this Markdown file into HTML.

To install, run `npm install markdown-html -g`

To convert, run `markdown-html readme.md -o readme.html -s custom-style.css`
