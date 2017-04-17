#!/bin/bash

mkdir /opt/blenderMod

mkdir /opt/blenderMod/bashFiles /opt/blenderMod/blendFiles



# moves the icons
sudo find /home/$SUDO_USER/Downloads/OC_suite/Blender_mod/icons/48x48 -name '*.png' -exec cp -t /usr/share/icons/hicolor/48x48/apps {} +

sudo find /home/$SUDO_USER/Downloads/OC_suite/Blender_mod/icons/256x256 -name '*.png' -exec cp -t /usr/share/icons/hicolor/256x256/apps {} +

# copies the desktop entries
sudo find /home/$SUDO_USER/Downloads/OC_suite/Blender_mod/desktopEntries -name '*.desktop' -exec cp -t /usr/share/applications {} +

# copies the blendfiles
sudo find /home/$SUDO_USER/Downloads/OC_suite/Blender_mod/blendFiles -name '*.blend' -exec cp -t /opt/blenderMod/blendFiles {} +

# copies bashfiles that execute .blend files
sudo find /home/$SUDO_USER/Downloads/OC_suite/Blender_mod/bashFiles -name '*.sh' -exec cp -t /opt/blenderMod/bashFiles {} +


