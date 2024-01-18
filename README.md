# Monitoring with Prometheus, Grafana

With this repo we can understand the below topics
1. Monitoring flow
2. Prometheus (node exporter, service discovery, pushgatway)
3. Grafana (dashboards & reporting)

** To run the Python code to push the run time app logs to prometheus pushgateway **
```
git clone 
cd monitoring-prometheus-grafana
pip install -r app/requirements.txt
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