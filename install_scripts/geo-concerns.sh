#!/bin/sh

echo "Creating a stock Geo Concerns app"

# create a curation-concerns app
rails new geo-concerns-demo --skip-spring
cd geo-concerns-demo
sudo gem install simple_mapnik
echo "gem 'curation_concerns', '1.0.0.beta3'" >> Gemfile
echo "gem 'geo_concerns', '0.0.5'" >> Gemfile
bundle install
yes Y | rails generate curation_concerns:install
yes Y | rails generate geo_concerns:install
rake db:migrate

# start redis
sudo /etc/init.d/redis-server start

# start fedora and solr
SHARED_DIR=$1
sudo cp $SHARED_DIR/install_scripts/fedora-solr /etc/init.d/
sudo update-rc.d fedora-solr start 90 2 3 4 5 .
sudo /etc/init.d/fedora-solr start
