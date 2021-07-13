# ruby syntax

Vagrant.configure("2") do |config|
  
  # Do not use code from line 5 to 7
  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
  end

  config.vm.box = "ubuntu/xenial64"
  # using ubuntu 16.04 LTS box
  
  # let's connect to nginx using private ip
    config.vm.network "private_network", ip: "192.168.10.100"
  # we would like to load this ip using our host machine's browser
  # to view default nginx page
   
    config.hostsupdater.aliases = ["development.local"]
    # if the plugin is installed correctly update with vagrant destroy then vagrant up
    # we should be able to see nginx page in the browser with http://development.local 

    # Sync data from localhost/host machine to our VM
    # vm home location path is: /home/vagrant/
 #   ------------ "provision.sh", "/home/vagrant" ( for windows)
 # ----------------"provision.sh"  "/home/ubuntu/" (for mac and Linux)
 	config.vm.synced_folder ".", "/home/vagrant/environment"
 	                 # localhost  location insdie the vm
 	# change made on OS                 
end
