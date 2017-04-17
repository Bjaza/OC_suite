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

func_bversion() {
    blender --version | head -n1 | cut -c 9-12
}

BVERSION=$(func_bversion)

mkdir -p /home/$SUDO_USER/.config/blender/$BVERSION/config

sudo chmod -R 771 /home/$SUDO_USER/.config/blender

echo 'Adding startup file'

# adds custom startup file
sudo find /home/$SUDO_USER/Downloads/OC_suite/Blender_mod/vanillaStartup -name 'startup.blend' -exec cp -t /home/$SUDO_USER/.config/blender/$BVERSION/config {} +


echo 'Finished!'
