# Project 1: Configure Kubernetes Cluster with Docker on Linux

## Prerequisites:

Provision three EC2 instances for configuring a master node and two worker nodes for Kubernetes Cluster
or use the ec2instance.tf file provided to provision using terraform.

## Step 01: Install Docker

Install docker on all nodes in your cluster. 
I'm using Ubuntu Distribution for Linux.

**Below commands can be used to install Docker:**
    
    sudo apt-get update
    sudo apt-get install -y docker.io

## Step 2: Install Kubeadm

Install Kubeadm for the master node by following the documentation for your linux distribution.

**Below command can be used to install Kubeadm**

    sudo apt-get update
    sudo apt-get install -y apt-transport-https curl
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
    sudo apt-get update
    sudo apt-get install -y kubelet kubeadm kubectl

## Step 3: Initialize Cluster

**Use the below command to initialize cluster**

    $ sudo kubeadm init --pod-network-cidr=192.168.0.0/16

