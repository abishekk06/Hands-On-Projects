# Prometheus and Grafana for Monitoring and Visualization

Using these Tools we can Monitor Resources like  Cpu usage,Container and your Application performance and Network traffic, server and application health and You can Even Create Your Own Custom metrics.

## Topics:

Installing Prometheus, Node Explorer and Grafana on Ubuntu EC2 Instance.

**Prometheus** is an open-source monitoring system used for collecting and storing time-series data. It was originally built at SoundCloud to monitor their large-scale infrastructure. With Prometheus, you can monitor everything from server CPU and memory usage to application-specific metrics.

**Grafana** is a data visualization and dashboarding platform that can be used to display the data collected by Prometheus. It provides a flexible and user-friendly interface for creating charts, graphs, and dashboards.

**Node_exporter** is a Prometheus exporter used for collecting hardware and operating system metrics from a target system. It is designed to be lightweight and easy to install on a variety of systems.

The combination of Prometheus, Grafana, and node_exporter provides a powerful monitoring and visualization solution for organizations of all sizes. By using these tools, you can gain valuable insights into your infrastructure and applications, helping you identify and fix issues before they become critical.

## Step 1:

Create Three EC2 Instances for a Controller and two nodes.
In the `controller` we'll install Prometheus, Node Exporter and Grafana.

Other two nodes `target1`, `target2` will be our target machines with only Node Explorer installed.

I used Ubuntu Image for the EC2 Instances in the same VPC and allowed all traffics in the Security Group.

Login to the instances and give each of them the unique hostname 

```
sudo hostnamectl set-hostname master
sudo hostnamectl set-hostname targer1
sudo hostnamectl set-hostname targer2
```
Note: Type `bash` for immediate effect, if the hostname is diff after restarting the server, it's because the hostname was set only in the shell. To make the hostname persistant, add it into the etc/hosts file.

Add its own instance IP and hostname for each machine.

## Step 2:

Now we install Node Exporter on all Machines, download the package and extract the file.

```
wget https://github.com/prometheus/node_exporter/releases/download/v1.5.0/node_exporter-1.5.0.linux-amd64.tar.gz
tar -xf node_exporter-1.5.0.linux-amd64.tar.gz
```

Now move the Node Exporter binary to /usr.local/bin

```
sudo mv node_exporter-1.5.0.linux-amd64/node_exporter  /usr/local/bin
rm -rv node_exporter-1.5.0.linux-amd64*
```

## Step 3:

Now we create users and service files for Node_Exporter.

```
sudo useradd -rs /bin/false node_exporter
```

When we run this command, a new user accout named `node_exporter` is created. The default shell for this acc is set to "/bin/false" which means that user cannot log in to the account.

```
sudo cat /etc/passwd | grep node_exporter
```

Now we will create a **systemd unit** so that the node-explorer can start at boot.

```
sudo cat <<EOF | sudo tee /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
After=network.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target
EOF
```

This is to be added to  the "node_exporter.service" file. This systemd unit file sets up to service to run the node_exporter user, and starts the "/usr/local/bin/node_exporter"

```
sudo cat /etc/systemd/system/node_exporter.service
```

Use it to check if the file is created and the content is added.

