#!/bin/bash
cd /opt
mkdir blenderMod
cd blenderMod
mkdir bashFiles blendFiles

cd ~

# moves the icons
sudo find ~/Downloads/OC_suite/Blender_mod/icons/48x48 -name '*.png' -exec mv -t /usr/share/icons/hicolor/48x48/apps {} +

sudo find ~/Downloads/OC_suite/Blender_mod/icons/256x256 -name '*.png' -exec mv -t /usr/share/icons/hicolor/256x256/apps {} +

# copies the desktop entries
sudo find ~/Downloads/OC_suite/Blender_mod/desktopEntries -name '*.desktop' -exec mv -t /usr/share/applications {} +

# copies the blendfiles
sudo find ~/Downloads/OC_suite/Blender_mod/blendFiles -name '*.blend' -exec mv -t /opt/blenderMod/blendFiles {} +

# copies bashfiles that execute .blend files
sudo find ~/Downloads/OC_suite/Blender_mod/bashFiles -name '*.sh' -exec mv -t /opt/blenderMod/bashFiles {} +


