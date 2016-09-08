# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define "geoconcerns", primary: true do |geoconcerns|
    geoconcerns.vm.box = "geoconcerns/geo-concerns-vagrant-base"

    geoconcerns.vm.network :forwarded_port, guest: 3000, host: 3000 # Rails
    geoconcerns.vm.network :forwarded_port, guest: 8983, host: 8983 # Solr 5.4
    geoconcerns.vm.network :forwarded_port, guest: 8984, host: 8984 # Fedora 4.5

    geoconcerns.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end

    shared_dir = "/vagrant"

    geoconcerns.vm.provision "shell", path: "./install_scripts/geo-concerns.sh", args: shared_dir, privileged: false
  end

  config.vm.define "geoserver", primary: true do |geoserver|
    geoserver.vm.box = "geoconcerns/geoserver-vagrant"

    geoserver.vm.network :forwarded_port, guest: 8080, host: 8181

    geoserver.vm.provider "virtualbox" do |v|
      v.memory = 2048
    end

    shared_dir = "/vagrant"
  end
end
