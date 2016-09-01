#!/bin/sh

echo "Setting up ruby environment"

# pre-requisites
PACKAGES="imagemagick libreadline-dev libyaml-dev libsqlite3-dev libqtwebkit-dev nodejs zlib1g-dev libsqlite3-dev nodejs redis-server"
sudo apt-get -y install $PACKAGES

# Install Ruby using the RVM
# This includes bundler and rails
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --rails
