FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

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

RUN mkdir -p /etc/ansible
RUN echo "[local]\n" \
"localhost ansible_connection=local\n\n" \
"[group1]\n" \
"host1 ansible_host=remote-host-one ansible_user=test ansible_password=s3cr3t\n" \
"host2 ansible_host=remote-host-two ansible_user=test ansible_password=s3cr3t\n" \
> /etc/ansible/hosts