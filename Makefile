#install Pythin 3, Ansible, openshift
sh sudo apt update && sudo apt install -y python3 && sudo apt install -y python3-pip && sudo pip3 install ansible && sudo pip3 install openshift

#add this directory to the $PATH
sh echo "export PATH=$PATH:~/.local/bin" >> ~/.bashrc && . ~/.bashrc

#nstall the Ansible role necessary for deploying a Jenkins instance
ansible-galaxy install geerlingguy.jenkins

#Install the Docker role
ansible-galaxy install geerlingguy.docker
