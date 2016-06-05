#!/bin/sh

if [ -d "demo" ]; then
  rm -rf demo/
fi

mkdir demo

cp -R install_scripts/ demo/install_scripts
cp Vagrantfile demo/
cd demo

# Use 32 bit base for the demo. Command works on Mac and GNU sed
# Comment this line out if you want to build for 64bit.
sed -i.bak 's/trusty64/trusty32/g' Vagrantfile && rm Vagrantfile.bak

# Build and package the box
vagrant up
vagrant package --output geo-concerns.box
vagrant destroy -f

rm -rf .vagrant/
rm -rf downloads/
rm -rf install_scripts/

# Remove provision instructions from Vagrantfile
sed -i.bak '20,30d' Vagrantfile && rm Vagrantfile.bak

# Use the new box
sed -i.bak 's/ubuntu\/trusty32/geo-concerns.box/g' Vagrantfile  && rm Vagrantfile.bak
