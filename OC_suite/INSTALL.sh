#!/bin/bash



#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.

#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

echo "Wellcome"

command -v wget >/dev/null 2>&1 || { echo >&2 "I require wget but it's not installed. Please check README.   Aborting."; exit 1; }
command -v git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed. Please check README.   Aborting."; exit 1; }

echo "This might take a few minutes..."

PACKAGES="blender gimp krita"

func_apt-get() {
	sudo apt-get install -y $PACKAGES
}

func_yum() {
	sudo yum install -y $PACKAGES 
}

func_up2date() {
	sudo up2date -i $PACKAGES 
}

func_pacman() {
	sudo pacman -S $PACKAGES 
}

func_dnf() {
    sudo dnf install -y $PACKAGES
}

haveProg() {
	[ -x "$(which $1)" ]
}


if haveProg apt-get ; then func_apt-get
elif haveProg yum ; then func_yum
elif haveProg up2date ; then func_up2date
elif haveProg pacman ; then func_pacman
elif haveProg dnf ; then func_dnf
else
	echo 'No package manager found!'
	exit 2
fi

echo 'Applying mods'

# modifies GIMP
wget https://raw.githubusercontent.com/doctormo/GimpPs/master/tools/install.sh
chmod +x ./install.sh
./install.sh

# applies changes to blender
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

# sets permissions
sudo chmod 755 /opt/blenderMod/bashFiles/blenderFX.sh
sudo chmod 755 /opt/blenderMod/bashFiles/blenderSB.sh
sudo chmod 755 /opt/blenderMod/bashFiles/blenderVE.sh

# adds custom theme
sudo find /home/$SUDO_USER/Downloads/OC_suite/Blender_mod -name 'userpref.blend' -exec cp -t /home/$SUDO_USER/.config/blender/*/config {} +

# adds custom startup file
sudo find /home/$SUDO_USER/Downloads/OC_suite/Blender_mod -name 'startup.blend' -exec cp -t /home/$SUDO_USER/.config/blender/*/config {} +

# adds MaiaDark theme to Krita
sudo find /home/$SUDO_USER/Downloads/OC_suite/Krita_mod -name 'kritarc' -exec cp -t /home/$SUDO_USER/.config {} +
sudo find /home/$SUDO_USER/Downloads/OC_suite/Krita_mod -name 'MaiaDark.colors' -exec cp -t /usr/share/color-schemes {} +

echo 'Finished!'
