#!/bin/bash
# Hardware requirements: AWS Linux 2 with mimum t2.micro type instance & port 9090, should be allowed on the security groups
# Attach a role to this Prometheus server with IAM policy as --> AmazonEC2ReadOnlyAccess

# Installing Git
sudo yum install git -y

# Setting up prometheus
sudo useradd --no-create-home prometheus
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
 
wget  https://github.com/prometheus/prometheus/releases/download/v2.23.0/prometheus-2.23.0.linux-amd64.tar.gz
tar -xvf prometheus-2.23.0.linux-amd64.tar.gz
sudo cp prometheus-2.23.0.linux-amd64/prometheus /usr/local/bin
sudo cp prometheus-2.23.0.linux-amd64/promtool /usr/local/bin
sudo cp -r prometheus-2.23.0.linux-amd64/consoles /etc/prometheus/
sudo cp -r prometheus-2.23.0.linux-amd64/console_libraries /etc/prometheus
sudo cp prometheus-2.23.0.linux-amd64/promtool /usr/local/bin/

rm -rf prometheus-2.23.0.linux-amd64.tar.gz prometheus-2.19.0.linux-amd64

# setting up the dependencies from the repo setup
sudo git clone https://github.com/cvamsikrishna11/monitoring-prometheus-grafana.git /tmp/monitoring-prometheus-grafana
sudo cp /tmp/monitoring-prometheus-grafana/prometheus-dependencies/prometheus.yml /etc/prometheus/
sudo cp /tmp/monitoring-prometheus-grafana/prometheus-dependencies/prometheus.service /etc/systemd/system/prometheus.service

# give file permissions for the prometheus user
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus

# start prometheus
sudo systemctl daemon-reload
sudo systemctl enable prometheus
sudo systemctl start prometheus