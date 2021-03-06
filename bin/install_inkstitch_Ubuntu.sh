# This file is part of the Inkscape extension 'ink/stitch', 
# an extension for machine embroidery design using Inkscape.

# Copyright (C) 2017 Maren Hachmann

# ink/stitch is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# ink/stitch is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with ink/stitch.  If not, see <http://www.gnu.org/licenses/>.

#!/bin/bash

# we want to be in the tmp directory
cd /tmp

# delete old snap Inkscape (we really don't want a snap!)
sudo snap remove inkscape

echo "Adding Inkscape stable apt-repository"

# add stable-daily repository
sudo add-apt-repository ppa:inkscape.dev/stable

# refresh package list
sudo apt-get update

# install everything we need
sudo apt-get install inkscape python-pip unzip python-wxgtk3.0

# download lexelby's embroidery extension
wget https://github.com/lexelby/inkstitch/archive/master.zip

# unzip files
unzip master.zip -d /tmp

# change into new directory
cd inkstitch-master

# upgrade pip
pip install -U pip

# install requirements (only with user privileges, not system-wide)
pip install --user -r requirements.txt

# create extensions directory if doesn't exist yet
mkdir -p $HOME/.config/inkscape/extensions

# copy all *.py and *.inx files there
cp *.py *.inx $HOME/.config/inkscape/extensions

echo "============================

The Inkscape embroidery extension (https://github.com/lexelby/inkstitch) and its dependencies have been installed, and your Inkscape version is now up to date.

Any previously installed Inkscape snap packages have been removed."
