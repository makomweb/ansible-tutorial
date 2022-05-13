# Ansible Tutorial

This tutorial uses Docker to provide a playground for Ansible.
The scenario here has 3 Docker containers running in the same network.

1. the ansible container
2. the remote-host-one container
3. the remote-host-tow container

The ansible container is used to manage the other 2 host containers via - of course Ansible. :-)

## Steps

~~~bash
# build the images
docker-compose build

# run the containers
docker-compose up -d

# open a shell on the ansible container
docker exec -it ansible bash

# ssh from the ansible container into the host container to test availability
ssh test@remote-host-one

# exit from the ssh
exit

# check ansible version
ansible --version

# ping the remote host via ansible module
ansible host1 -i inventory.txt -m ping
~~~

## Install VIM on a host container

~~~bash
apt-get update
apt-get install vim
~~~