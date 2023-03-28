# Project 1: Configure Kubernetes Cluster with Docker on Linux

## Prerequisites:

Provision three EC2 instances for configuring a master node and two worker nodes for Kubernetes    Cluster.

or use the ec2instance.tf file provided to provision using terraform.

## Step 01: Install 

install docker on all nodes in your cluster. 

I'm using Ubuntu Distribution for Linux.

**Below commands can be used to install Docker:**
    
    sudo apt-get update
    sudo apt-get install -y docker.io

## Step 2: Install Kubeadm

