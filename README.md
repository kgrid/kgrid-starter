## Knowledge Grid Starter Guide

### Section 1. Prepare your system

To set up and run Knowledge Grid from your local machine, the system should have the following required software:

- [Java SE Development Kit 8](http://www.oracle.com/technetwork/pt/java/javase/downloads/jdk8-downloads-2133151.html)

- [Oracle VirtualBox 5.1](https://www.virtualbox.org/wiki/Download_Old_Builds_5_1) - Note get VirtualBox version 5.1 which is compatible with Vagrant. 

- [Vagrant](https://www.vagrantup.com/downloads.html)

- [Node.js and npm](https://www.npmjs.com/get-npm) - Note: get the long-term release version.

If needed, these software can be found in the folder of 'Downloads' in Knowledge Grid Starter Kit, or be downloaded from the respective links shown above.

### Section 2. Download KGRID Components and Provision

Once the system has all prerequisites, the following KGRID Components are needed:

- [Knowledge Grid - customized Fedora 4 Vagrant Virtual Machine](https://github.com/kgrid/fcrepo4-vagrant/releases) in the folder of `\fcrepo4-vagrant`

- [Knowledge Grid Library](https://github.com/kgrid/kgrid-library/releases) in the folder of `\library`

- [Knowledge Grid Activator](https://github.com/kgrid/kgrid-activator/releases) in the folder of `\activator`

- [Knowledge Grid Python Adapter](https://github.com/kgrid/python-adapter/releases) in the folder of `\activator\adapters`

- [Knowledge Grid Starter Sample Knowledge Objects](KO Pack links) in the folder of `\activator\shelf`

- [Knowledge Grid Starter Client App](https://github.com/kgrid/cancer-advisor/releases) in the folder of `\cancer-advisor-0.5`

These components are already installed in Knowledge Grid Starter Kit, or be downloaded from the respective links shown above if needed and saved in the designated folders.

### File structure
A typical file structure for the Knowledge Grid Starter Kit will look like this:

```
├── downloads
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
│   └── install.sh
├── cancer-advisor-0.5
│   ├── css
│   ├── js
│   ├── data
│   └── index.html
├── readme.md
├── readme.html
├── restart.sh
├── stop.sh
└── start.sh
```

Now, everything is ready.


### Section 3. Griddy Up and Run!

At the root of Knowledge Grid Starter Kit, run the script:
  - For Mac: kgrid_start.sh
  - For Windows: kgrid_start.bat

For the first time run, an initialization process is required to provision the Fedora vagrant, add the knowledge objects to the library and load the knowledge objects to the activator.

To perform the initialization, run the script with the option of `init`

  `kgrid_start --init`

To start the provisioned knowledge grid, simply run

  `kgrid_start`

The script will:

- start the Fedora vagrant virtaul machine;

- Provision the vagrant virtual machine (init only);

- start Knowledge Grid Library service at localhost:8081;

- start knowledge Grid Activator at loalhost:8082;

- add the knowledge objects to the library (init only);

- load the knowledge objects to the activtor (init only);

- launch Knowledge Grid Library Web App in the browser;

- launch the client Web App in the browser.


### Appendix - Convert MD file to HTML file

A node.js module `markdown-html` can be used to convert this Markeddown file into HTML.

To install, run `npm install markdown-html -g`

To convert, run `markedown-html readme.md -o readme.html -s custom-style.css`
