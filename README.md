# Monitoring with Prometheus, Grafana

![alt text](https://github.com/cv/[reponame]/blob/[branch]/image.jpg?raw=true)

With this repo we can understand the below topics
1. Monitoring flow
2. Prometheus (node exporter, service discovery, pushgatway)
3. Grafana (dashboards & reporting)


## Installations
1. Prometheus Installation 
    Configurations: 
        1. OS & AMI: AWS EC2 Linux 2 Version AMI (Please be careful the AMI is the 2nd one from the drop-down)
        2. Security Groups: Enable Ports 9090 (for prometheus) and port 9091 (for pushgateway) allow access from anywhere (just for the demonstration)
        3. Make sure to attach an IAM role with Admin access for prometheus (for Proemetheus server to perform service discovery on the EC2 instances)
        4. Link for the user data: https://github.com/cvamsikrishna11/monitoring-prometheus-grafana/blob/main/prometheus-setup.sh
2. Launch web servers
        1. OS & AMI: AWS EC2 Linux 2 Version AMI (Please be careful the AMI is the 2nd one from the drop-down)
        2. No of instances: 3
        3. Security Groups: Enable Ports 80 (for HTTP traffic of the website) and port 9100 (for node exporter) allow access from anywhere (just for the demonstration)        
        4. Link for the user data: https://github.com/cvamsikrishna11/monitoring-prometheus-grafana/blob/main/ecommerce-web-app.sh
3. Grafana
        1. OS & AMI: Ubuntu Version 20.04 LTS AMI (Please be careful the AMI is the 2nd one from the drop-down)
        2. Security Groups: Enable Ports 3000 (for Grafana)allow access from anywhere (just for the demonstration)        
        4. Link for the user data: https://github.com/cvamsikrishna11/monitoring-prometheus-grafana/blob/main/grafana-setup.sh

** To run the Python code to push the run time app logs to prometheus pushgateway **
```
git clone https://github.com/cvamsikrishna11/monitoring-prometheus-grafana.git
cd monitoring-prometheus-grafana
pip install -r app/requirements.txt
```
Change line number 19 of the app/shoe-hub.py file with your own Prometheus server Public IP

Now, Run the code to send the application logs to Prometheus
```
python app/shoe-hub.py
```

Ref: <br/>
https://prometheus.io <br/>
https://prometheus.io/docs/introduction/overview/ <br/>
https://devopscube.com/install-configure-prometheus-linux/ <br/>
https://devopscube.com/monitor-linux-servers-prometheus-node-exporter/ <br/>
https://prometheus.io/docs/prometheus/latest/configuration/configuration/#ec2_sd_config <br/>
https://devopscube.com/integrate-visualize-prometheus-grafana/ <br/>
https://grafana.com/docs/grafana/latest/dashboards/dashboard-public/ <br/>
https://prometheus.io/download/#pushgateway
https://samber.github.io/awesome-prometheus-alerts/rules.html