#!/bin/bash

func_bversion() {
    blender --version | head -n1 | cut -c 9-12
}

BVERSION=$(func_bversion)

mkdir -p /home/$SUDO_USER/$BVERSION
