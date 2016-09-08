# GeoConcerns Vagrant Box
## A Vagrant Box for the [GeoConcerns](https://github.com/projecthydra-labs/geo_concerns) Hydra-based Rails engine.
## Requirements

* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

## Setup

1. `git clone https://github.com/geoconcerns/geo-concerns-vagrant.git`
2. `cd geo-concerns-vagrant`
3. `vagrant up`

You can shell into the GeoConcerns machine with `vagrant ssh geoconcerns`, and into the GeoServer machine with `vagrant ssh geoserver`

## Using GeoConcerns

* A stock [GeoConcerns](https://github.com/projecthydra-labs/geo_concerns) app is built in the Vagrant in `/home/vagrant/geo-concerns-demo`
  * Once connected to the Vagrant VM, start with:
    * `cd geo-concerns-demo; rake demo:servers`
    * Access the app at [http://localhost:3000](http://localhost:3000).
    * To setup an initial user account:
      * Click "Log In" in the upper right, and then "Sign up" in the login form.
        * Enter your username and password, and click "Sign up" to create your account and sign in.
	* Once signed in, you can create content by clicking the "+" button in the upper right.

## Using GeoServer
* Access the server at [http://localhost:8181/geoserver/web/](http://localhost:8181/geoserver/web/).

## Environment

* Ubuntu 14.04 64-bit base machine
* A stock [Geo Concerns](https://github.com/projecthydra-labs/geo_concerns) app which can be run at: [http://localhost:3000](http://localhost:3000)
* [Solr](http://lucene.apache.org/solr/): [http://localhost:8983/solr/](http://localhost:8983/solr/)
* [Fedora](http://fedorarepository.org/): [http://localhost:8984/](http://localhost:8984/)
* [GeoServer](http://geoserver.org/) will be run at: [http://localhost:8181/geoserver/web/](http://localhost:8181/geoserver/web/)

## Build a Demo Vagrant Box
A script for building a reusable geo-concerns vagrant box is included.

1. `./build-demo.sh` (this will take some time to complete)
2. `cd demo/`
3. Instructions for starting the machine are the same as above.

After building the box, you can move the `demo/` directory to another location (such as thumb dive), or leave it in place. All that is needed is the `geo-concerns.box` file and the `Vagrantfile`.

## Thanks

The GeoConcerns VM is a modified version of [curation-concerns-vagrant](https://github.com/projecthydra-labs/curation-concerns-vagrant). Thanks to @escowles and the other contributors to that project.  The GeoServer VM is is the work of @drh-stanford and members of the Stanford University Libraries.
