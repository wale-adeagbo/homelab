## Homelab Infrastructure Portfolio

Simulating enterprise IT environments through hands-on infrastructure engineering, automation, monitoring, and identity management.


## Overview
This repository documents a production-grade homelab built on a physical mini PC, designed to mirror real-world enterprise IT environments. Each project within this lab addresses a distinct operational domain — from infrastructure provisioning and configuration management to observability, identity, and security.
The goal is not just to build systems, but to document decisions, validate outcomes, and demonstrate operational maturity — the same standards expected in professional IT environments.

## Environment

Component details:
* Device: Bosgame Mini PC.
* RAM: 16 GB.
* Storage: 512 GB SSD.
* OS (Primary): Ubuntu 26.04 LTS (dual boot).
* OS (Secondary): Windows 11 Pro.
* Virtualisation: Hyper-V (Windows) / VirtualBox (Ubuntu). 
* Platform: Docker Desktop.
* Automation: Ansible, Terraform.
* Monitoring: Prometheus, Grafana, Alertmanager.
* Security: Wazuh SIEM, fail2ban, UFW.
* Cloud: AWS (eu-west-2 London).

## Projects

### 1. Cloud Integration — AWS & Terraform
Provisioned a complete AWS cloud environment using Terraform, then managed the EC2 instance via Ansible from the local control node — demonstrating hybrid infrastructure management across local and cloud environments.

What was built:

* VPC, public subnet, internet gateway and route table via Terraform.
* Security group with SSH and application port rules.
* EC2 instance (Amazon Linux 2023) provisioned in eu-west-2 (London).
* SSH key pair uploaded to AWS via Terraform.
* Ansible inventory extended with aws_nodes group.
* Amazon Linux system setup playbook (dnf, firewalld).
* Full infrastructure destroyed cleanly via terraform-destroy.

Key skills: AWS · Terraform · EC2 · VPC · Ansible · Hybrid Cloud · IaC

### 2. Security Hardening & SIEM
Implemented a layered security approach combining SSH hardening, firewall configuration, brute force protection, and a full SIEM deployment for real-time threat detection.

What was built:

* SSH hardening playbook — root login disabled, password auth disabled, MaxAuthTries 3.
* Fail2ban configured with 1 hour ban on 3 failed attempts
* UFW firewall rules — default deny incoming, allow SSH/HTTP/HTTPS/Prometheus
* Wazuh 4.9.2 deployed via Docker Compose (single-node)
* SSL certificates generated for secure Wazuh communication
* Ansible-node-01 enrolled as active Wazuh monitored endpoint

Key skills: Wazuh · SIEM · fail2ban · UFW · SSH hardening · Docker · Security monitoring.

### 3. Infrastructure Automation — Ansible & Terraform
Provisioned and configured virtual machines using Infrastructure as Code principles. Ansible manages configuration and package deployment across managed nodes. Terraform handles VM provisioning via the VirtualBox provider.

What was built:

* Ansible control node configured with SSH key authentication
* Inventory-driven playbook execution across managed nodes
* System setup playbook — essential packages, UFW firewall configuration
* Terraform configuration to provision VMs declaratively
* Second VM (ansible-node-02) provisioned entirely via terraform apply

Key skills: Ansible · Terraform · SSH hardening · IaC · Linux administration

### 4. Monitoring & Observability Stack
Deployed a full monitoring pipeline using Prometheus, Grafana, and Alertmanager to collect system metrics, visualise performance trends, and trigger alerts based on defined thresholds.

What was built:

* Metrics collection using windows_exporter on the host.
* Real-time performance dashboards in Grafana.
* Alerting rules for CPU, memory, disk usage, and host availability.
* Alertmanager routing and notification configuration.
* Failure simulation to validate alert triggers.

Key skills: Prometheus · Grafana · Alertmanager · Observability · SLA monitoring

### 5. Active Directory Lab
Designed and implemented a fully functional Active Directory environment simulating enterprise identity and access management practices.

What was built:

* Windows Server domain controller (homelab.local)
* Organisational Units (OUs) with structured user and group management
* Domain-joined Windows client machine
* Group Policy Objects (GPOs) — screen lock enforcement, system restrictions
* Centralised authentication and access control validation

Key skills: Active Directory · Windows Server · GPO · IAM · DNS.

## Repository Structure.
```
Homelab/
├── ansible/
│   ├── ansible.cfg                      # Control node configuration
│   ├── inventory/                       # Managed node inventory
│   └── playbooks/
│       ├── system-setup.yml             # Base Ubuntu server configuration
│       ├── system-setup-amazon.yml      # Base Amazon Linux configuration
│       ├── ssh-hardening.yml            # SSH hardening + fail2ban
│       └── ufw-rules.yml               # UFW firewall rules
├── terraform/
│   ├── main.tf                          # VirtualBox VM provisioning
│   ├── modules/                         # Reusable Terraform modules
│   └── aws/
│       └── main.tf                      # AWS infrastructure (VPC, EC2)
├── wazuh/
│   └── docker-compose.yml              # Wazuh SIEM deployment
├── monitoring/
│   ├── prometheus.yml                   # Prometheus scrape configuration
│   ├── alertmanager.yml                 # Alertmanager routing configuration
│   ├── docker-compose.yml              # Monitoring stack composition
│   └── rules/                          # Prometheus alerting rules
├── active-directory-lab/               # AD setup documentation and screenshots
└── .gitignore                          # Excludes secrets, state files, keys
```
---

## Skills Demonstrated
*  Cloud & Infrastructure - AWS · Terraform · Ansible · VirtualBox · Hyper-V · Docker · Linux administration.
*  Security - Wazuh · SIEM · fail2ban · UFW · SSH hardening · Threat detection
*  Monitoring & Observability - Prometheus · Grafana · Alertmanager · Metrics collection · Alert engineering
*  Identity & Access Management - Active Directory · Windows Server · Group Policy · DNS · Organisational design
*  Networking - VPC · Subnets · Security Groups · NAT · SSH · Firewall (UFW · firewalld)
*  Documentation & Process - Runbook authoring · Architecture decision records · Operational documentation

## Design Principles
Every project in this homelab is built around three core operational principles:

* Document everything — configuration decisions, architecture choices, and troubleshooting steps are recorded as they happen, not after.
* Simulate failure — monitoring and alerting are only meaningful when validated against real failure scenarios.
*  Automate repeatably — manual steps are converted to code wherever possible, ensuring environments are reproducible.

## Roadmap
- Integrate Ansible with Active Directory environment.
- Expand monitoring to cover all VM nodes.
- Implement SSH hardening playbook for AWS nodes.
- Explore Azure AD / Entra ID integration for hybrid identity.
- Add Kubernetes (K3s) cluster for container orchestration.

## Related Repositories
[Incident-Response-Playbook](https://github.com/wale-adeagbo/Incident-Response-Playbook) - An incident handling processes that complement this lab's monitoring setup.

[SLA-Uptime-Tracker](https://github.com/wale-adeagbo/SLA-Uptime-Tracker) - A service monitoring tool aligned with the observability work here.

[Change-Management-Workflow](https://github.com/wale-adeagbo/Change-Management-Workflow) - An ITIL-aligned change process for infrastructure changes.

---

### Author
Adewale Adeagbo
