#!/bin/bash

# Script pour créer l'architecture Ansible dev + prod

BASE_DIR="./ansible"

echo "Création de l'architecture Ansible dans $BASE_DIR..."

# Création des dossiers principaux
mkdir -p $BASE_DIR/{inventories/dev/group_vars,inventories/prod/group_vars,playbooks,roles/{common,tasks,network,system,database,services,monitoring}}

# Inventories dev/prod
touch $BASE_DIR/inventories/dev/hosts.ini
touch $BASE_DIR/inventories/dev/group_vars/all.yml
touch $BASE_DIR/inventories/dev/group_vars/vms.yml

touch $BASE_DIR/inventories/prod/hosts.ini
touch $BASE_DIR/inventories/prod/group_vars/all.yml
touch $BASE_DIR/inventories/prod/group_vars/vms.yml

# Playbooks
touch $BASE_DIR/playbooks/00_init.yml
touch $BASE_DIR/playbooks/10_network.yml
touch $BASE_DIR/playbooks/20_system.yml
touch $BASE_DIR/playbooks/30_database.yml
touch $BASE_DIR/playbooks/40_services.yml
touch $BASE_DIR/playbooks/50_monitoring.yml

# Roles main.yml
for role in common network system database services monitoring; do
    mkdir -p $BASE_DIR/roles/$role/tasks
    touch $BASE_DIR/roles/$role/tasks/main.yml
done

# Optionnel : host_vars vides pour dev
mkdir -p $BASE_DIR/inventories/dev/host_vars
touch $BASE_DIR/inventories/dev/host_vars/vm106.yml
touch $BASE_DIR/inventories/dev/host_vars/vm202.yml
touch $BASE_DIR/inventories/dev/host_vars/vm501.yml

echo "Architecture Ansible créée avec succès !"
