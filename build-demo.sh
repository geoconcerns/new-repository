#!/bin/sh

if [ -d "demo" ]; then
  rm -rf demo/
fi

mkdir demo

cp -R install_scripts/ demo/install_scripts
cp Vagrantfile demo/
cd demo

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
