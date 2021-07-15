# ruby syntax

Vagrant.configure("2") do |config|

  config.vm.define "app" do |app|
    app.vm.box = "ubuntu/xenial64"
    app.vm.network "private_network", ip:"192.168.10.100"
    app.vm.synced_folder ".","/home/vagrant/environment"
    app.vm.provision "shell", path: "environment/provision.sh"
end 
  config.vm.define "db" do |db|
    db.vm.box = "ubuntu/xenial64"
    db.vm.network "private_network", ip:"192.168.10.50"
end 
  #config.vm.box = "ubuntu/xenial64"
  # using ubuntu 16.04 LTS box
  
  # let's connect to nginx using private ip
  #config.vm.network "private_network", ip:"192.168.10.100"
  # we would like to load this ip using our host machine's browser
  # to view default nginx page
  #config.vm.synced_folder ".","/home/vagrant/environment"
    #config.hostsupdater.aliases = ["development.local"]
    # if the plugin is installed correctly update with vagrant destroy then vagrant up
    # we should be able to see nginx page in the browser with http://development.local 

      

end
