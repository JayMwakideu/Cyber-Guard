# Cyber-Guard

## Overview
This is an open-source unified security solution designed to enhance an organizational 
cybersecurity through a cohesive process of monitoring network activities across various 
devices, analyzing and enriching security events using various tools for further threat analysis. 
It integrates with threat intelligence sharing and leverages a SOAR platform to automate the 
incident response workflow, creating a streamlined and efficient defense ecosystem against 
cyber threats.

![cyber-guard](https://github.com/JayMwakideu/Unified-Cyber-Guard-/assets/20043716/1a9238dc-dd22-4e1a-b257-531e1a6be9b1)


## Features
- **Security Onion:** Security Onion is a free and open platform for threat hunting, enterprise security monitoring, and log management.
- **Suricata:** open-source IDS/IPS cybersecurity tool that acts as both an Intrusion Detection System (IDS) and an Intrusion Prevention System (IPS).
- **Wazuh:** Real-time monitoring and alerting for security events.
- **DFIR-IRIS:** Streamlined incident response and forensics capabilities.
- **Shuffle:** Automated workflow management to streamline security processes.
- **MISP:** Open source threat intelligence platform.
- **MineMeld:** MineMeld is an open-source application from Palo Alto Networks that streamlines the aggregation, enforcement and sharing of threat intelligence

## Prerequisites
- Docker and Linux basic.
- Basic understanding of cybersecurity principles.

## Quick Installation
- First, you need to clone the repository:
  git clone https://github.com/JayMwakideu/Cyber-Guard
- Move to the directory and execute the installation script:
  cd cyber-guard
  chmod +x setup.sh
  ./setup.sh

## Detailed Installation and Usage

https://cyberguard.jaylansolutions.co.ke/

## Demo IPs & Credentials
| Service | Web Interface | Username | Password |
|---------|---------------|----------|----------|
| Security Onion | https://<ip> | demo | MySuperDemo@2024! |
| Suricata| https://<ip> | demo | MySuperDemo@2024! |
| Wazuh | https://<ip> | demo | MySuperDemo@2024! |
| OpenSearch | https://<ip> | demo | MySuperDemo@2024! |
| Shuffle | http://<ip>:3001 | demo | MySuperDemo@2024! |
| DFIR-IRIS | https://<ip>:8443 | demo | MySuperDemo@2024! |
| MISP | https://<ip>:1443 | demo | MySuperDemo@2024! |
| MineMeld | https://<IP> | demo | MySuperDemo@2024! |


## License

| Component | Licensing |
|-----------|-----------|
| Security Onion | GNU General Public License v2.0 |
| Suricata| Apache License 2.0 |
| Wazuh | GNU General Public License v2.0 |
| OpenSearch | Apache License 2.0 |
| Shuffle | GNU Affero General Public License v3.0 |
| DFIR-IRIS | GNU Lesser General Public License v3.0 |
| MISP | GNU Affero General Public License v3.0 | 
| MineMeld | GNU Affero General Public License v3.0 & Apache 2.0 license| 

## Acknowledgments

I want to express my sincere gratitude to Nusantara and Universitas Indonesia - Japan International Cooperation Agency (UI-JICA Project) for their T-Gaurd development. This development has led to further integration of IDS.



