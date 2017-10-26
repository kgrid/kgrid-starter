# Knowledge Grid Starter Guide

## Section 1. Prepare your system

To set up and run Knowledge Grid from your local machine, the system should have the following required software:

- Java SE Development Kit 8 [(http://www.oracle.com/technetwork/pt/java/javase/downloads/jdk8-downloads-2133151.html)](http://www.oracle.com/technetwork/pt/java/javase/downloads/jdk8-downloads-2133151.html)

- Oracle VirtualBox  [(https://www.virtualbox.org/wiki/Downloads)](https://www.virtualbox.org/wiki/Downloads)

- Vagrant           [(https://www.vagrantup.com/downloads.html)](https://www.vagrantup.com/downloads.html)

- Node.js and npm  [(https://www.npmjs.com/get-npm)](https://www.npmjs.com/get-npm)

If needed, these software can be found in the folder of 'Downloads' in Knowledge Grid Starter Kit, or be downloaded from the respective links shown above.

## Section 2. Download KGRID Components and Provision

Once the system has all prerequisites, the following KGRID Components are needed:

- Knowledge Grid - customized Fedora 4 Vagrant Virtual Machine  [(https://github.com/kgrid/fcrepo4-vagrant/releases)](https://github.com/kgrid/fcrepo4-vagrant/releases) in the folder of `\fcrepo4-vagrant`

- Knowledge Grid Library [(https://github.com/kgrid/kgrid-library/releases)](https://github.com/kgrid/kgrid-library/releases) in the folder of `\library`

- Knowledge Grid Activator [(https://github.com/kgrid/kgrid-activator/releases)](https://github.com/kgrid/kgrid-activator/releases) in the folder of `\activator`

- Knowledge Grid Python Adapter [(https://github.com/kgrid/python-adapter/releases)](https://github.com/kgrid/python-adapter/releases) in the folder of `\activator\adapters`

- Knowledge Grid Starter Sample Knowledge Objects
[(KO Pack links)]()  in the folder of `\library\knowledge-objects`

- Knowledge Grid Starter Client App [(https://github.com/kgrid/cancer-advisor/releases)](https://github.com/kgrid/cancer-advisor/releases) in the folder of `\cancer-advisor`

These components are already installed in Knowledge Grid Starter Kit, or be downloaded from the respective links shown above if needed and saved in the designated folders.

## File structure
A typical file structure for the Knowledge Grid Starter Kit will look like this:

```
 ├── fcrepo4-vagrant
 ├── library
 │   ├── init_script.sh
 │   ├── knowledge-objects
 │   └── kgrid-library-0.2.4-SNAPSHOT.war
 ├── activator
 │   ├── adapters
 │   │   ├── python-adapter-0.5.8-SNAPSHOT-jar-with-dependencies.jar
 │   ├── shelf
 │   │   ├── 99999-fk4571p57h
 │   │   ├── 99999-fk4n87hh26
 │   │   ├ ...
 │   │   ├ ...
 │   │   └── 99999-fk4805c32z
 │   ├── init_script.sh
 │   └── activator-0.5.8-SNAPSHOT.war
 ├── cancer-advisor
 │   ├── init_script
 │   ├── css
 │   ├── js
 │   ├── data
 │   └── index.html
 └── kgrid_script.sh
```

Now, everything is ready.


## Section 3. Griddy Up and Run!

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

- start Knowledge Grid Library service at localhost:8090;

- start knowledge Grid Activator at loalhost:8091;

- add the knowledge objects to the library (init only);

- load the knowledge objects to the activtor (init only);

- launch Knowledge Grid Library Web App in the browser;

- launch the client Web App in the browser.
