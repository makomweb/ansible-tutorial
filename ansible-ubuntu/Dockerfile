FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV ANSIBLE_HOST_KEY_CHECKING=False

RUN apt-get update && \
    apt-get install -y gcc python-dev libkrb5-dev && \
    apt-get install python3-pip -y && \
    pip3 install --upgrade pip && \
    pip3 install --upgrade virtualenv && \
    pip3 install pywinrm[kerberos] && \
    apt install krb5-user -y && \
    pip3 install pywinrm && \
    pip3 install ansible && \
    apt install -y openssh-client && \
    apt install -y openssh-server && \
    apt install -y sshpass

COPY inventory.txt /etc/ansible/hosts