!#/bin/bash

sudo apt-get update -y
# got to vagrant official doc to find the code
# sync this file from local host to out VM
sudo apt-get upgrade -y

sudo apt-get install nginx -y

sudo systemctl restart nignx 
