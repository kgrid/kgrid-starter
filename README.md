## README

### Knowledge Grid Starter Kit can downloaded at [Kgrid Starter release page](https://github.com/kgrid/kgrid-starter/releases).

Note: If you are using a Knowledge Starter Kit Drive, the kit has been unzipped. Go directly to Step 3.

1. Download the latest version and unzip (to the Desktop for example).

   A folder with a name like `kgrid-starter-0.5` will be created.

2. Change to that folder.

3. Open the file `setup.html` .

4. Follow the step-by-step instructions to install, set up and run the knowledge grid from your local machine.


### Enjoy!


### Appendix

#### Convert MD file to HTML file

A node.js module `markdown-html` can be used to convert this Markdown file into HTML.

To install, run `npm install markdown-html -g` from the command line.

To convert, run `markdown-html readme.md -o readme.html -s custom-style.css` from the command line.

#### Creating a base image (for example, on a USB stick)

1. Download the kgrid-starter source .zip file (suggest downloading to your machine rather than directly to the USB stick for speed)
1. __Remove the quarantine attribute if you are on a Mac!__   
  `xattr -d com.apple.quarantine kgrid-starter-x.y`
1. `unzip kgrid-starter-x.y.zip`
1. `cd kgrid-starter-x.y`
1. download the rest of the Kgrid components  
  `./install-scripts/download.sh`
1. Copy the kgrid starter to the usb stick if you didn't download directly to the USB stick  
  `cd ..`  
  `cp -R kgrid-starter-x.y [path/to/my/usb]`  
  `cp kgrid-starter-x.y.zip [path/to/my/usb]`
