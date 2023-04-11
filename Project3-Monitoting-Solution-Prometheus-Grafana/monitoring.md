# Prometheus and Grafana for The Ultimate Monitoring and Visualization Experience

Using these Tools we can Monitor Resources like  Cpu usage,Container and your Application performance and Network traffic, server and application health and You can Even Create Your Own Custom metrics.

## Topics:

Installing Prometheus, Node Explorer and Grafana on Ubuntu EC2 Instance.

**Prometheus** is an open-source monitoring system used for collecting and storing time-series data. It was originally built at SoundCloud to monitor their large-scale infrastructure. With Prometheus, you can monitor everything from server CPU and memory usage to application-specific metrics.

**Grafana** is a data visualization and dashboarding platform that can be used to display the data collected by Prometheus. It provides a flexible and user-friendly interface for creating charts, graphs, and dashboards.

**Node_exporter** is a Prometheus exporter used for collecting hardware and operating system metrics from a target system. It is designed to be lightweight and easy to install on a variety of systems.

The combination of Prometheus, Grafana, and node_exporter provides a powerful monitoring and visualization solution for organizations of all sizes. By using these tools, you can gain valuable insights into your infrastructure and applications, helping you identify and fix issues before they become critical.

## Step 1:

Create Three EC2 Instances for a Controller and two nodes.
In the 'controller' we'll install Prometheus, Node Exporter and Grafana.

Other two nodes 'Node1', 'Node2' will be our target machines with only Node Explorer installed.

I used Ubuntu Image for the EC2 Instances in the same VPC and allowed all traffics in the Security Group.
