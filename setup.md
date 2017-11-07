## Knowledge Grid Starter Installation and Set Up Guide

### Quick Start

 To install and set up the starter kit, you'll need administrator privileges on your machine, and intermediate skills with installing software and using the command line. For instructions on setting up your machine, see ___Section 1. Prepare your system___


1. Download the kgrid-starter source zip from [Kgrid Starter release page (latest version)](https://github.com/kgrid/kgrid-starter/releases/latest) and unzip it (for example on your Desktop). Open a terminal window, and navigate to the `../kgrid-starter-x.y` folder.

 If using the kgrid-starter USB stick just copy `/kgrid-starter-x.y` to your Desktop—it's already unzipped—then open a terminal window and navigate to the folder. __Skip to step 3__.

2. Run the `./install-scripts/download` script to download additional Kgrid components.

3. Start the knowledge grid: `./kg-start` (The first time, this takes a while). When it's running, a browser window opens with links to the Kgrid components. Confirm that the Cancer Advisor client is working.

4. Initialize the Library: `./install-scripts/init`. Once initialized, there should be 6 knowledge objects in the Library matching the Cancer Advisor objects.

5. To stop the Kgrid: `./kg-stop`


#### Windows and Linux users: These instructions are tailored for installing on a Mac. Windows users can use the `.bat` files in the kgrid-starter folder, and your operating system commands for navigating, installing, and running some applications may be different. See Appendix A for more info.

### Section 1. Prepare your system

To set up and run Knowledge Grid from your local machine, the system should have the following required software:

- [Java SE Development Kit 8](http://www.oracle.com/technetwork/java/javase/downloads/index.html) - Note: get Java SE 8
- [Oracle VirtualBox 5.1](https://www.virtualbox.org/wiki/Download_Old_Builds_5_1) - Note: get VirtualBox version 5.1 which is compatible with Vagrant.
- [Vagrant](https://www.vagrantup.com/downloads.html)
- [Node.js + npm](https://www.npmjs.com/get-npm) - Note: get the long-term release version.
- After installing Node.js and `npm`, install the demo server (to run client apps). From the command line:  
  `npm install -g live-server`

Note: If you are using a Windows system, you will need to download and install cURL at [cURL Download Page](http://www.confusedbycode.com/curl)

To verify the verisons for installed sotware, you can run from the command line:

```
java -version                    # JAVA version
vboxmanage -version              # Virtual Box version
vagrant --version                # Vagrant version
npm list -g live-server version  # live-server version
```

### Section 2. Download KGRID Components

If you are using the pre-configured starter kit drive, skip this section and go to Section 3. If you downloaded the starter kit source from Github, you will need to download  additional KGRID Components:

#### Components already installed with the kgrid-starter

- [Fedora Commons - Fedora 4 Vagrant Virtual Machine](https://github.com/kgrid/fcrepo4-vagrant/releases) preinstalled in the folder of `\fcrepo4-vagrant-4.5.1`
- [Knowledge Grid Starter Client App (Cancer Advisor)](https://github.com/kgrid/cancer-advisor/releases) pre-installed in the folder of `\cancer-advisor-0.5`
- [Knowledge Grid Starter Sample Knowledge Objects](KO Pack links) in the folder of `\activator\shelf`

#### Components to be downloaded and saved in the designated folders.

Open a terminal, change to the kgrid starter folder, and run the `download` script in the `install_scripts`:

```
  cd /[path to kgrid_starter]/kgrid-starter-0.6
  ./install-scripts/download     # Use download.bat in Windows
```

Or, to download manually, use the following links and save the files into the designated folders:

- [Knowledge Grid Library](https://github.com/kgrid/kgrid-starter/releases/latest): Download and save the library file in the folder of `\library`. The war file starts with `kgrid-library`
- [Knowledge Grid Activator](https://github.com/kgrid/kgrid-starter/releases/latest): Download and save the activator file in the folder of `\activator`. The war file starts with `activator`
- [Knowledge Grid Python Adapter](https://github.com/kgrid/kgrid-starter/releases/latest): Download and save the pythn adapter file in the folder of `\activator\adapters`.  The jar file starts with `python-adapter`

Now, everything is ready. Next step: Start the Knowledge Grid and initialize the repo.


### Section 3. Griddy Up and Run!

#### Initialize the Fedora repo and the library (first time)

```
cd /[path to kgrid_starter]/kgrid-starter-0.6
./kg-start   # Use kg-start.bat for Windows
                # This will take a while, also starts the Library  
./install-scripts/init # This loads objects in the library
```

__The Library, Activator, and Cancer Advisor client should be running!__

Browser windows should be launched for the Library and the Cancer Advisor. You can also navigate to:

- localhost:8081/health to see the status of the library
- localhost:8080/fcrepo/rest (fedoraAdmin:secret3) to see the fedora repo running
- localhost:8082/shelf to see objects loaded in the Activator


#### Starting and stopping the Knowledge Grid

From the command line, run the start script in the root of Knowledge Grid Starter Kit (e.g. `kgrid-starter-0.6`):

  ```
  cd /[path to kgrid_starter]/kgrid-starter-0.6
  ./kg-start   # Use kg-start.bat in Windows
  ```

  This will start:

  - the Fedora vagrant virtual machine on `localhost:8080`;
  - Knowledge Grid Library service at `localhost:8081`;
  - Knowledge Grid Activator at `localhost:8082`;
  - A HTTP server (via `live-server`) on `localhost:8083`, hosting the Cancer Advisor at `/cancer-advisor-0.5`

And it will launch a welcome page in the browser, which contains the links to Knowledge Grid Library Web App, the Cancer Advisor and other useful resources.


---

### Appendix A - Additional Information for Setup in Windows and manual shutdown

Whereas the shell script is required for Mac/Linux, a batch file is provided to perform the same task for Windows, as indicated in the inline notes above.

To use these scripts in Windows,
- Open a command terminal and run the scripts from the command line;
- For downloading Knowledge Grid components, run
```
  cd \[path to kgrid_starter]\kgrid-starter-0.6
  install-scripts\download.bat
```

- For initialize the Fedora repo and the library (first time), run
```
cd \[path to kgrid_starter]\kgrid-starter-0.6
kg-start.bat                   # This will take a while, also starts the Library  
install-scripts\init.bat       # This loads objects in the library
```
- For starting the knowledge Grid, run
```
cd \[path to kgrid_starter]\kgrid-starter-0.6
kg-start.bat
```
- For shutting down, run
```
cd \[path to kgrid_starter]\kgrid-starter-0.6
kg-stop.bat
```
The Knowledge Grid components can also be shut down manually by running the comamnds.

In Windows:
```
cd \[path to kgrid_starter]\kgrid-starter-0.6
netstat -ano |findstr 8083     # This will reutrn the process ID (PID) for the live-server
taskkill /pid [PID] /F         # Replace [PID] with the ID found from previous command
netstat -ano |findstr 8082     # This will reutrn the process ID (PID) for the activator
taskkill /pid [PID] /F         # Replace [PID] with the ID found from previous command
netstat -ano |findstr 8081     # This will reutrn the process ID (PID) for the library
taskkill /pid [PID] /F         # Replace [PID] with the ID found from previous command
cd fcrepo4-vagrant-4.5.1
vagrant halt
```

In Linux:
```
pkill -afl "8081"
pkill -afl "8082"
pkill -afl live-server
cd fcrepo4-vagrant-4.5.1
vagrant halt
cd ..
```

__Warning: The scripts and manual shutdown procedures are only tested on Windows 7 or later and Mac. For other Windows builds, please consult the operating system documentation for the proper commands/options to perform the tasks.__


### Appendix B - File structure
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
│   ├── download
│   ├── download.bat
│   ├── init.bat
│   └── init
├── cancer-advisor-0.5
│   ├── css
│   ├── js
│   ├── data
│   └── index.html
├── readme.md
├── index.html
├── setup.html
├── quickstart.html
├── kg-restart
├── kg-start.bat
├── kg-start
├── kg-stop.bat
└── kg-stop
```
### Troubleshooting

The Knowledge Grid Starter runs on ports 8080-8083. If something is running on those ports the components won't start. To find out what's running and kill it, you can try netstat:

```bash
netstat -vanp tcp | grep 8080
tcp4       0      0  *.8080                 *.*                    LISTEN       65536  65536  22904      0

```

Or, for OSX El Capitan and newer (or if your netstat doesn't support -p), use lsof:

```bash
sudo lsof -i tcp:8080
COMMAND     PID     USER   FD   TYPE             DEVICE SIZE/OFF NODE NAME
VBoxHeadl 22904 pboisver   16u  IPv4 0x3ce0b9cc3fe3f9cd      0t0  TCP *:http-alt (LISTEN)
``` 

use the process id (`pid`) to kill the process:

```bash
kill 22904
```

#### Questions?
Send an email to Knowledge Grid Development Team at dlhs.knowledge.grid@umich.edu.
