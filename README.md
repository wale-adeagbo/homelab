# Homelab

## Overview

This repository documents my homelab projects built on a mini PC showcasing systems administration, monitoring, identity management, and IT operations.

The goal of this homelab is to simulate real-world enterprise environments and demonstrate hands-on experience with infrastructure, observability, and operational workflows.

---

## Environment

* Device: Bosgame Mini PC
* OS: Windows 11 Pro
* RAM: 16 GB
* Storage: 512 GB SSD
* Virtualization: Hyper-V
* Container Platform: Docker Desktop

---

## Projects

### 🔹 Monitoring & Observability Lab

Implemented a monitoring stack using Prometheus, Grafana, and Alertmanager to collect system metrics, visualize performance, and trigger alerts based on defined thresholds.

**Key Features**

* Metrics collection using `windows_exporter`
* Real-time dashboards in Grafana
* Alerting for CPU, memory, disk, and host availability
* Validation through simulated failures

 [View project](./monitoring-observability)

---

### 🔹 Active Directory Lab

Designed and implemented an Active Directory environment with a domain controller, domain-joined client, centralized user management, and Group Policy enforcement.

**Key Features**

* Domain setup (`homelab.local`)
* Organizational Units (OUs) and user management
* Domain-joined Windows client
* Group Policy implementation (screen lock, system restrictions)

 [View project](./active-directory-lab)

---

## Objectives

* Build practical, hands-on infrastructure projects
* Understand enterprise IT systems and operations
* Document setup, troubleshooting, and validation
* Develop a portfolio aligned with IT Operations and IT Management roles

---

## Skills Demonstrated

* Systems Administration (Windows Server, Active Directory)
* Monitoring & Observability (Prometheus, Grafana)
* Virtualization (Hyper-V)
* Networking (internal virtual networks, DNS configuration)
* Identity & Access Management
* Incident awareness and troubleshooting

---

## Future Improvements

* Integrate monitoring with Active Directory environment
* Expand to multi-node monitoring setup
* Add security monitoring (SIEM tools such as Wazuh)
* Explore cloud integration (Azure AD / Entra ID)
* Automate deployments using scripting or configuration tools

---

## Related Work

## Related Work

- [IT Incident Response Playbook](https://github.com/wale-adeagbo/Incident-Response-Playbook)  - which defines incident handling processes and complements the monitoring and infrastructure projects in this homelab.

---

## Author

**Adewale Adeagbo**

---
