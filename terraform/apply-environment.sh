#!/bin/bash
echo "Подготовка окружения"

terraform fmt
terraform plan

echo "Создание инфраструктуры"
terraform apply -auto-approve

echo "Генерация inventory.ini для Ansible"
terraform output -json instances_info | jq -r '
  .[] | "\(.name) ansible_host=\(.ip) ansible_user=\(.user) ansible_ssh_private_key_file=\(.public_ssh_key) ansible_python_interpreter=/usr/bin/python3 ansible_ssh_common_args="-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null""
' > ../ansible/inventory.ini

echo "\n[webservers]" >> ../ansible/inventory.ini
terraform output -json instances_info | jq -r '
  .[] | "\(.name)"
' >> ../ansible/inventory.ini

echo "Генерация env.j2 для Ansible"
terraform output -json | jq -r '"REDMINE_DB_HOST=" + .db_host.value' >> ../ansible/templates/env.j2
