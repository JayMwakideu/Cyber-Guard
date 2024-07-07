#!/bin/bash

while true; do
    OPTION=$(whiptail --title "Main Menu" --menu "Choose an option:" 20 70 13 \
                    "1" "Update System and Install Prerequisites" \
                    "2" "Install Docker" \
                    "3" "Install Security-Onion (IDS)" \
                    "4" "Install Suricata (IDS)" \
                    "5" "Install Wazuh (SIEM)" \
                    "6" "Install Shuffle (SOAR)" \
                    "7" "Install DFIR-IRIS (Incident Response Platform)" \
                    "8" "Install MineMeld (Incident Response Platform)" \
                    "9" "Setup Simulation and POC" \
                    "10" "Install MISP" \
                    "11" "Setup IRIS <-> Wazuh Integration" \
                    "12" "Setup MISP <-> Wazuh Integration" \
                    "13" "Setup minemeld <-> Wazuh Integration" \
                    "14" "Setup security-onion <-> Wazuh Integration" \
                    "15" "Setup suricata <-> Wazuh Integration" \
                    "16" "Show Status" 3>&1 1>&2 2>&3)
    # Script version 1.0 updated 15 November 2023
    # Depending on the chosen option, execute the corresponding command
    case $OPTION in
    1)
        sudo apt-get update -y
        sudo apt-get upgrade -y
        sudo apt-get install wget curl nano git unzip -y
        ;;
    2)
        # Check if Docker is installed
        if command -v docker > /dev/null; then
            echo "Docker is already installed."
        else
            # Install Docker
            curl -fsSL https://get.docker.com -o get-docker.sh
            sudo sh get-docker.sh
            sudo systemctl enable docker.service && sudo systemctl enable containerd.service
        fi
        ;;
    3)
        cd security-onion
        sudo docker compose build
        sudo docker compose up -d
        ;;

    4)
        cd suricata
        sudo docker compose build
        sudo docker compose up -d
        ;;
    5)
        cd wazuh
        sudo docker network create shared-network
        sudo docker compose -f generate-indexer-certs.yml run --rm generator
        sudo docker compose up -d
        ;;
    6)
        cd shuffle
        sudo docker compose up -d
        ;;
    7)
        cd iris-web
        sudo docker compose build
        sudo docker compose up -d
        ;;
    8)
        cd MineMeld
        sudo docker compose build
        sudo docker compose up -d
        ;;
    9)
        wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O SecList.zip \
        && unzip SecList.zip \
        && rm -f SecList.zip
        cd examples/poc-wazuh/brute-force
        sudo docker compose build
        sudo docker compose up -d
        ;;
    10)
        cd misp
        IP=$(curl -s ip.me -4)
        sed -i "s|BASE_URL=.*|BASE_URL='https://$IP:1443'|" template.env
        cp template.env .env
        sudo docker compose up -d
        ;;
    11)
        cp wazuh/custom-integrations/custom-iris.py /var/lib/docker/volumes/wazuh_wazuh_integrations/_data/custom-iris.py
        sudo docker exec -ti wazuh-wazuh.manager-1 chown root:wazuh /var/ossec/integrations/custom-iris.py
        sudo docker exec -ti wazuh-wazuh.manager-1 chmod 750 /var/ossec/integrations/custom-iris.py
        sudo docker exec -ti wazuh-wazuh.manager-1 apt update -y
        sudo docker exec -ti wazuh-wazuh.manager-1 apt install python3-pip -y
        sudo docker exec -ti wazuh-wazuh.manager-1 pip3 install requests
        cd wazuh && sudo docker compose restart
        ;;
    12)
        cp wazuh/custom-integrations/custom-misp.py /var/lib/docker/volumes/wazuh_wazuh_integrations/_data/custom-misp.py
        sudo docker exec -ti wazuh-wazuh.manager-1 chown root:wazuh /var/ossec/integrations/custom-misp.py
        sudo docker exec -ti wazuh-wazuh.manager-1 chmod 750 /var/ossec/integrations/custom-misp.py
        cp wazuh/custom-integrations/local_rules.xml /var/lib/docker/volumes/wazuh_wazuh_etc/_data/rules/local_rules.xml
        sudo docker exec -ti wazuh-wazuh.manager-1 chown wazuh:wazuh /var/ossec/etc/rules/local_rules.xml
        sudo docker exec -ti wazuh-wazuh.manager-1 chmod 550 /var/ossec/etc/rules/local_rules.xml
        cd wazuh && sudo docker compose restart
        ;;

    13)
        cd wazuh && sudo docker compose restart
        ;;   
    14)
        cd wazuh && sudo docker compose restart
        ;; 
    15)
        cd wazuh && sudo docker compose restart
        ;; 
    16)
        sudo docker ps
        ;;
esac
    # Give option to go back to the previous menu or exit
    if (whiptail --title "Exit" --yesno "Do you want to exit the script?" 8 78); then
        break
    else
        continue
    fi
done
