# Ansible tutorial

This tutorial uses Docker to provide a playground for Ansible.
The scenario here has 3 Docker containers running in the same network.

1. the ansible container
2. the remote-host-one container
3. the remote-host-two container

The ansible container is used to manage the other 2 host containers via - of course Ansible. :smiley:

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

## Install VI in a container

~~~bash
apt-get update
apt-get install vim
~~~

## Check module collection

~~~bash
ansible-galaxy collection list
~~~

## Install 3 new users on each host

- paste the content of the yml file into a playbook file on the ansible master

~~~bash
$> ansible-playbook playbook1.yml --extra-vars "ansible_sudo_pass=s3cr3t"`
~~~

## Install Aptitude

~~~bash
apt-get update
apt-get install aptitude
~~~