## Homelab Infrastructure Portfolio

Simulating enterprise IT environments through hands-on infrastructure engineering, automation, monitoring, and identity management.


## Overview
This repository documents a production-grade homelab built on a physical mini PC, designed to mirror real-world enterprise IT environments. Each project within this lab addresses a distinct operational domain — from infrastructure provisioning and configuration management to observability, identity, and security.
The goal is not just to build systems, but to document decisions, validate outcomes, and demonstrate operational maturity — the same standards expected in professional IT environments.

## Environment

Component details:
* Device: Bosgame Mini PC.
* RAM: 16 GB.
* Storage: 512 GB SSD
* OS (Primary): Ubuntu 26.04 LTS (dual boot)
* OS (Secondary): Windows 11 Pro.
* Virtualisation: Hyper-V (Windows) / VirtualBox (Ubuntu) Container. 
* Platform: Docker Desktop.
* Automation: Ansible, Terraform.
* Monitoring: Prometheus, Grafana, Alertmanager.

## Projects
### 1. Infrastructure Automation — Ansible & Terraform
Provisioned and configured virtual machines using Infrastructure as Code principles. Ansible manages configuration and package deployment across managed nodes. Terraform handles VM provisioning via the VirtualBox provider.
What was built:
- Ansible control node configured with SSH key authentication
- Inventory-driven playbook execution across managed nodes
- System setup playbook — essential packages, UFW firewall configuration
- Terraform configuration to provision VMs declaratively
- Second VM (ansible-node-02) provisioned entirely via terraform apply

Key skills: Ansible · Terraform · SSH hardening · IaC · Linux administration

### 2. Monitoring & Observability Stack
Deployed a full monitoring pipeline using Prometheus, Grafana, and Alertmanager to collect system metrics, visualise performance trends, and trigger alerts based on defined thresholds.
What was built:

* Metrics collection using windows_exporter on the host.
* Real-time performance dashboards in Grafana.
* Alerting rules for CPU, memory, disk usage, and host availability.
* Alertmanager routing and notification configuration.
* Failure simulation to validate alert triggers.

Key skills: Prometheus · Grafana · Alertmanager · Observability · SLA monitoring

### 3. Active Directory Lab
Designed and implemented a fully functional Active Directory environment simulating enterprise identity and access management practices.
What was built:

- Windows Server domain controller (homelab.local)
- Organisational Units (OUs) with structured user and group management
- Domain-joined Windows client machine
- Group Policy Objects (GPOs) — screen lock enforcement, system restrictions
- Centralised authentication and access control validation

Key skills: Active Directory · Windows Server · GPO · IAM · DNS.

### 4. Security Monitoring — Wazuh SIEM

Deployed Wazuh 4.9.2 as a containerised SIEM solution for 
real-time security monitoring, threat detection, and compliance.

**What was built:**
- Wazuh single-node deployment via Docker Compose
- SSL certificates generated for secure communication
- ansible-node-01 enrolled as active monitored endpoint
- Real-time security alerts and event monitoring active

**Key skills:** Wazuh · SIEM · Docker · Security Monitoring · 
Threat Detection · Compliance

## Repository Structure.
```
Homelab/
├── ansible/
│   ├── ansible.cfg              # Control node configuration.
│   ├── inventory/               # Managed node inventory.
│   └── playbooks/
│       └── system-setup.yml     # Base server configuration playbook.
├── terraform/
│   ├── main.tf                  # VM provisioning configuration.
│   └── modules/                 # Reusable Terraform modules.
├── active-directory-lab/        # AD setup documentation and screenshots.
├── rules/                       # Prometheus alerting rules.
├── prometheus.yml               # Prometheus scrape configuration.
├── alertmanager.yml             # Alertmanager routing configuration.
├── docker-compose.yml           # Monitoring stack composition.
└── .gitignore                   # Excludes secrets, state files, keys.
├── wazuh/
│   └── docker-compose.yml       # Wazuh SIEM deployment
```
---
## Skills Demonstrated -

- Infrastructure & Automation
Terraform · Ansible · VirtualBox · Hyper-V · Docker · Linux administration.

- Monitoring & Observability
Prometheus · Grafana · Alertmanager · Metrics collection · Alert engineering

- Identity & Access Management
Active Directory · Windows Server · Group Policy · DNS · Organisational design.

- Networking
Internal virtual networks · DNS configuration · NAT · SSH · Firewall (UFW).

- Documentation & Process
Runbook authoring · Architecture decision records · Operational documentation

## Design Principles
Every project in this homelab is built around three core operational principles:

- Document everything — configuration decisions, architecture choices, and troubleshooting steps are recorded as they happen, not after.
- Simulate failure — monitoring and alerting are only meaningful when validated against real failure scenarios.
- Automate repeatably — manual steps are converted to code wherever possible, ensuring environments are reproducible.


## Roadmap

- Integrate Ansible with Active Directory environment.
- Add security monitoring with Wazuh (SIEM). -- Done!
- Expand monitoring to cover VM nodes provisioned by Terraform.
- Implement SSH hardening playbook (fail2ban, root login disabled).
- Explore Azure AD / Entra ID integration for hybrid identity.


## Related Repositories
[Incident-Response-Playbook](https://github.com/wale-adeagbo/Incident-Response-Playbook) - An incident handling processes that complement this lab's monitoring setup.

[SLA-Uptime-Tracker](https://github.com/wale-adeagbo/SLA-Uptime-Tracker) - A service monitoring tool aligned with the observability work here.

[Change-Management-Workflow](https://github.com/wale-adeagbo/Change-Management-Workflow) - An ITIL-aligned change process for infrastructure changes.

---

### Author
Adewale Adeagbo
