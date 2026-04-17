# Windows Monitoring Homelab
A production-style monitoring and observability lab built on a Windows 11 mini PC using Docker, Prometheus, Grafana, Alertmanager, and Windows Exporter.

## Overview
This project was built as part of my homelab to demonstrate practical infrastructure monitoring, alerting, and operational visibility in a small but realistic environment.

The stack collects host-level metrics from a Windows 11 mini PC, visualizes them in Grafana dashboards, and evaluates alert conditions in Prometheus. The goal was to build a solution that reflects real-world IT operations work: not just deploying services, but monitoring health, identifying risk, and validating incident detection.

## Objectives
- Build a working observability stack on a Windows 11 mini PC
- Monitor core host metrics such as CPU, memory, and disk usage
- Visualize system health in Grafana
- Configure alert rules for common operational issues
- Simulate failure scenarios to validate alert behavior
- Document the setup in a way that is useful for interviews and portfolio review

## Environment
**Host**
- Bosgame Mini PC
- Windows 11

**Existing services on host**
- Docker Desktop
- Portainer
- Vaultwarden

**Monitoring stack**
- Prometheus
- Grafana
- Alertmanager
- Windows Exporter

## Architecture
Windows 11 Mini PC
├── windows_exporter (installed as Windows service)
├── Docker Desktop
│   ├── Prometheus
│   ├── Grafana
│   └── Alertmanager
├── Portainer
└── Vaultwarden

Setup Summary
1. Installed windows_exporter

windows_exporter was installed directly on the Windows host so Prometheus could collect host metrics such as CPU, memory, and disk information.

2. Deployed monitoring services with Docker Compose

Prometheus, Grafana, and Alertmanager were deployed as containers using Docker Compose.

3. Configured Prometheus

Prometheus was configured to:

scrape the Windows host through host.docker.internal:9182
load alert rules from the rules directory
forward alerts to Alertmanager
4. Connected Grafana to Prometheus

Grafana was configured with Prometheus as its data source and used to build a custom monitoring dashboard.

5. Created dashboards

A dashboard was created to show:

CPU Usage %
Memory Usage %
Disk Usage %
6. Configured alerts

Alert rules were created for:

WindowsHostDown
HighCPUUsage
LowDiskFreeSpace
HighMemoryUsage

Example PromQL Queries
CPU Usage %
100 - (avg by(instance) (rate(windows_cpu_time_total{mode="idle"}[5m])) * 100)
Memory Usage %
100 * (1 - (windows_memory_available_bytes / windows_cs_physical_memory_bytes))
Disk Usage %
100 * (1 - (windows_logical_disk_free_bytes{volume=~"[A-Z]:"} / windows_logical_disk_size_bytes{volume=~"[A-Z]:"}))
Alert Rules

This project includes the following alerts:

WindowsHostDown
Fires when Prometheus cannot scrape the Windows host for more than 1 minute.
HighCPUUsage
Fires when CPU usage remains above 85 percent for 5 minutes.
LowDiskFreeSpace
Fires when disk free space falls below 15 percent for 10 minutes.
HighMemoryUsage
Fires when available memory remains below 15 percent for 5 minutes.
Validation and Testing

To confirm the stack worked end to end, I validated both monitoring and alerting behavior.

Metrics validation

I verified that Prometheus was scraping the Windows host successfully and that Grafana returned live data for:

up
windows_cpu_time_total
windows_memory_available_bytes
windows_logical_disk_free_bytes
Alert validation

I simulated a host monitoring outage by stopping the windows_exporter Windows service.

Expected outcome

Prometheus target changed from UP to DOWN
WindowsHostDown moved from inactive to firing after 1 minute
Alert visibility was confirmed in Prometheus

This test demonstrated that the stack was not only deployed, but operationally useful.

Challenges and Lessons Learned

This project helped reinforce several practical lessons:

YAML formatting is unforgiving; mixing tabs and spaces breaks configuration files
Docker networking matters; container-to-host communication required the correct target path
Metric names can vary depending on exporter versions
Building dashboards manually improved my understanding of PromQL and metric structure
Observability is not only about visibility, but also about validating failure detection
Why This Project Matters

This homelab project reflects the kind of operational thinking needed in infrastructure and IT leadership roles. It demonstrates:

monitoring strategy
troubleshooting
service validation
alert design
documentation
structured problem solving

Rather than only deploying tools, this project focuses on how systems are observed, maintained, and validated.

Future Improvements

Planned next steps include:

Email notifications through Alertmanager
Log aggregation with Loki
Uptime checks with Blackbox Exporter
Monitoring Docker containers and self-hosted services such as Vaultwarden
Adding more hosts to create a centralized multi-node monitoring setup
Screenshots

<img width="1674" height="1255" alt="Screenshot 2026-04-17 164703" src="https://github.com/user-attachments/assets/d08a6d3f-ee03-4bcc-b9cc-d2c9c55ef6ae" />


#Grafana #Dashboard #Prometheus #Alerts

Author

- Adewale Adeagbo
