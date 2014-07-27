#!/bin/bash

set -xe

if [ ! -e /usr/lib/apt/methods/https ]; then
	apt-get update
	apt-get install -y apt-transport-https
fi

echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list
echo deb https://dokku-alt.github.io/dokku-alt / > /etc/apt/sources.list.d/dokku-alt.list

make install
apt-get install -y ruby ruby-sinatra

set +xe

if [ `lsb_release -sr` != "14.04" ]; then
	echo
	echo "WARNING: dokku-alt works best on Ubuntu 14.04 LTS!"
fi

echo
echo "Almost done!"
echo "Open now web browser pointing to http://$(hostname):2000/ to finish configuartion."
echo "For manual installation instructions press Ctrl-C and visit https://github.com/dokku-alt/dokku-alt."
echo

ruby /usr/local/share/dokku-alt/contrib/dokku-installer.rb
