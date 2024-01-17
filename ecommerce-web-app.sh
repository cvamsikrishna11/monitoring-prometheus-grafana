#!/bin/bash
# Hardware requirements: AWS Linux 2 with mimum t2.micro type instance & port 80(application port), 9100 (node-exporter port) should be allowed on the security groups

# Update the system
sudo yum update -y

# Install Apache HTTP Server (httpd)
sudo yum install httpd -y

# Install Git
sudo yum install git -y


# Clone the repository
git clone https://github.com/cvamsikrishna11/ecommerce-web-app.git

# Copy the files inside the cloned folder to the desired location
sudo cp -r ecommerce-web-app/server2/* /var/www/html/

# Start and enable the HTTP server
sudo systemctl start httpd
sudo systemctl enable httpd

# node-exporter installations
sudo useradd --no-create-home node_exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.0.1/node_exporter-1.0.1.linux-amd64.tar.gz
tar xzf node_exporter-1.0.1.linux-amd64.tar.gz
sudo cp node_exporter-1.0.1.linux-amd64/node_exporter /usr/local/bin/node_exporter
rm -rf node_exporter-1.0.1.linux-amd64.tar.gz node_exporter-1.0.1.linux-amd64

# setup the node-exporter dependencies
sudo git clone https://github.com/cvamsikrishna11/monitoring-prometheus-grafana.git /tmp/monitoring-prometheus-grafana
sudo cp /tmp/monitoring-prometheus-grafana/node-exporter-dependencies/node-exporter.service /etc/systemd/system/node-exporter.service