                            <DISCLAMER>
This Install script is meant for fresh installs and it will overwrite 
all your config and theme files, if present, for blender, Krita and Gimp. 
I will not be accountable for any lost files or broken systems. 

                            <ABOUT>
This is a design suite compiled from open source software.
It is all based on a bash script that installs Blender, FreeCAD, Krita and Gimp,
with some customizations to the themes an workspaces.

If you dont whant the custom themes run 'VANILLA_INSTALL.sh' instead of the 'INSTALL.sh'
When you run 'INSTALL.sh' the script checks which package manager your using and
installs the programs, from the repositories. After that it creates 3 custom desktop entries to Blender. 
These are blenderVE (video editing), blenderFX (compositor) and blenderSB (storyboard).

If you allready have blender and only whant the 

To run the INSTALL.sh open a terminal and cd into the OC_suite directory 
(be sure to extract the OC_suite.tar file to your Downloads directory).

do these commands to run the script:

    sudo chmod +x INSTALL.sh
    sudo ./INSTALL.sh

if the script returns: 
    "I require wget but it's not installed. Please check README.   Aborting."

install wget

if the script returns: 
    "I require git but it's not installed. Please check README.   Aborting."

install git

This script uses the MAIA_DARK theme for Krita and a mod script that makes Gimp look similar to photoshop.
All credit for these should go to the original authors

GimpPS: https://github.com/doctormo
Maia Dark: https://github.com/manjaro/artwork-maia


