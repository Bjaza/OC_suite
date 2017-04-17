#!/bin/bash
cd /opt
mkdir blenderMod
cd blenderMod
mkdir bashFiles blendFiles
cd ~/Downloads/OC_suite/Blender_mod/icons/48x48
mv *.png /usr/share/icons/hicolor/48x48/apps
cd ..
cd 256x256
mv *.png /usr/share/icons/hicolor/256x256/apps
cd ~/Downloads/OC_suite/Blender_mod/desktopEntries
mv *.desktop /usr/share/applications
cd ..
cd blendFiles
mv *.blend /opt/blenderMod/blendFiles
cd ..
cd bashFiles
mv *.sh /opt/blenderMod/bashFiles
