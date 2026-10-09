#example to install any  package using argument

#!/bin/bash

echo "install $1"
sudo apt-get update -y
sudo apt-get install $1 -y
echo "Successfully installed $1"
sudo systemctl status $1
sudo systemctl enable $1
