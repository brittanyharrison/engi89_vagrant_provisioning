# Vagrant Provisioning 

## Provisiong Shell Script 
A provisioning script is a script that can either be downloaded to, or downloaded and run on, a device during the provisioning process.

- Create a `provision.sh` file  in the environment folder. 


- In the provision.sh file, you will need to type a sequence of shell commands to automate the VM to execute when initialised. 

```
#!/bin/bash

# to update all your package lists 
sudo apt-get update -y

# to update all installed software to latest versions 
sudo apt-get upgrade -y

# install nginx 
sudo apt-get install nginx 

# shows nginx status 
systemctl status nginx

```

- To run provision.sh we need to give file permission and make this file executable. To change permission we use chmod with required permission then file name in the folder with the file.

```
chmod +x provision.sh
```

- To eexcute the shell script, we must input the following command within the Vagrantfile. 

```
# path is the location and name of the file 
config.vm.provision "shell", path: "environment/provision.sh"
```

## Synced folders 
Using synced folders, Vagrant will automatically sync our files to and from the guest machine. In Vagrantfile:

```
# config.vm.synced_folder "PATH_HOST_MACHINE", "PATH_GUEST_MACHINE"
config.vm.synced_folder ".", "/home/vagrant"
```

# Sparta Node Sample App - Task
Spec files contain the specifications for behavior driven development. The task is to succcessfully pass all the tests. 

- To run : `rake spec`

```
9 examples, 3 failures

Failed examples:

rspec ./spec/default/sample_spec.rb:17 # Package "nodejs" is expected to be installed
rspec ./spec/default/sample_spec.rb:21 # Command "nodejs --version" stdout is expected to match /v6./
rspec ./spec/default/sample_spec.rb:25 # Package "pm2" is expected to be installed by "npm"
```

To install version 6 of nodejs, the follwoing was inserted in the provision script.:

```
curl -sL https://deb.nodesource.com/setup_$v.6 | sudo -E bash -
sudo apt-get install -y nodejs
```

To install, "pm2" by npm :

```
npm install pm2 -g
```

# Environment Variables

- To write something save it into a file that doesnt exist:

sudo echo "testing code" >> test.text
cat test.text

- To save to a file that existist give an absolute direction 

etc/bashrc

- To create an environment variable: `export DB_HOST = mongodb"`
- To print the names and values of all currently defines variables: `printenv`
- To examine the value of a particular variable: `printenv DB_HOST`

# Persistent environment variables
A suitable file for environment variable settings that affect the system as a whole (rather than just a particular user) is **/etc/environment**. An alternative is to create a file for the purpose in the **/etc/profile.d** directory.

```
cd /etc
```


# Reverse Proxy 

cd /etc/nginx/sites-available

sudo nano default 

sudo rm -rf default 

sudo nginx -t

sudo systemctl restart nginx


sudo systemctl -l enable nginx

sudo systemctl -l start nginx



 # Multiple Machine Setup 
 - Install mongodb 
 ```
    sudo apt install -y mongodb

    sudo systemctl status mongodb
 ```
 
 - Create an env variable called `DB_HOST=dp_ip:27017` to connect to db 

```
sudo nano /etc/environment
DB_HOST=mongodb://192.168.10.150:27017/posts 
```
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv D68FA50FEA312927

echo "deb https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.2.list

sudo apt-get update -y

 sudo apt-get upgrade -y

~/.source\