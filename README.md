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
```text
Windows 11 Mini PC
├── windows_exporter (installed as Windows service)
├── Docker Desktop
│   ├── Prometheus
│   ├── Grafana
│   └── Alertmanager
├── Portainer
└── Vaultwarden
