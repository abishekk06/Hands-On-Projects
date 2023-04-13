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

Now move the Node Exporter binary to /usr/local/bin

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

Since we have  crated a unit file, we must reload the daemon, set the service to always run ar boot.

```
sudo systemctl daemon-reload  && sudo systemctl enable node_exporter
```

## Step 4:

Now we can check the Node_Exporter metrics.

Open the Browser and put the IP of the master node and the Port 9100 like below.

```
http://<public-ip-address>:9100
```

## Step 5:

Downloading and Installing Prometheus

```
wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz
tar -xf prometheus-2.43.0.linux-amd64.tar.gz
```

Move the binary to /usr/local/bin 

```
sudo mv prometheus-2.43.0.linux-amd64/prometheus prometheus-2.43.0.linux-amd64/promtool /usr/local/bin
```

Now, we need to Create directories for configuration files and other prometheus data.

```
sudo mkdir /etc/prometheus /var/lib/prometheus
```

We have to move the configuration file `console_libraries`

```
sudo mv prometheus-2.43.0.linux-amd64/console_libraries /etc/prometheus
ls /etc/prometheus
```

delete the leftover files as we do not need them

```
sudo rm -rvf prometheus-2.43.0.linux-amd64*
```

## Step 6:

Now We Configure Prometheus on our `master` machine.

we have to let know prometheus know the enpoints `target1` and `target2` for it to monitor them.

Go to /etc/hosts and replace `x.x.x.x` with the `private-ip-address` for target machines we want to monitor.

```
sudo nano /etc/hosts
```

As I am using AWS EC2 Instances, I put the private-ip-address from the AWS EC2 Console.

```
<private-ip-address>    target1
<private-ip-address>    target2
```

Now we create the `prometheus.yml` in the Prometheus directory that we created.

```
sudo cat <<EOF | sudo tee /etc/prometheus/prometheus.yml
global:
  scrape_interval: 10s

scrape_configs:
  - job_name: 'prometheus_metrics'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9090']
  - job_name: 'node_exporter_metrics'
    scrape_interval: 5s
    static_configs:
      - targets: ['localhost:9100','target1:9100','target2:9100']
EOF
```

We can also change the ownership of the directory/file 

```
sudo useradd -rs /bin/false prometheus
sudo chown -R prometheus: /etc/prometheus /var/lib/prometheus
```

verify the same with

```
sudo ls -l /etc/prometheus/
```

Now We will create a systemd unit file the following contents:

```
sudo cat <<EOF | tee /etc/systemd/system/prometheus.service
[Unit]
Description=Prometheus
After=network.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus \
    --config.file /etc/prometheus/prometheus.yml \
    --storage.tsdb.path /var/lib/prometheus/ \
    --web.console.templates=/etc/prometheus/consoles \
    --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF
```

[Unit]:
Provides metadata about the service
**Description=Prometheus** sets the name of the service to “Prometheus”
**After=network.target** specifies that the service should start after the network is available

[Service]:
Defines how the service should be managed by systemd
**User=prometheus** specifies that the service should run as the “prometheus” user
**Group=prometheus** specifies that the service should run as the “prometheus” group
**Type=simple** specifies that the service should be run as a simple process
**ExecStart=/usr/local/bin/prometheus** specifies the location of the Prometheus binary that should be run
— **config.file /etc/prometheus/prometheus.yml** specifies the location of the Prometheus configuration file
— **storage.tsdb.path /var/lib/prometheus/** specifies the location of the storage directory where Prometheus should store its data
— **web.console.templates=/etc/prometheus/consoles** specifies the location of the directory containing the web console templates
— **web.console.libraries=/etc/prometheus/console_libraries** specifies the location of the directory containing the web console libraries

[Install]:
Specifies when the service should be started and which system target should be associated with
**WantedBy=multi-user.target** specifies that the service should be started when the system is in the multi-user target.

```
sudo ls -l /etc/systemd/system/prometheus.service
```