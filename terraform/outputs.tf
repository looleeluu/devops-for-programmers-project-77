output "reserved_public_ip" {
  description = "Зарезервированный публичный IP-адрес"
  value       = yandex_vpc_address.stat_address.external_ipv4_address.0.address
}

output "db_username" {
  description = "Имя администраторатора базы данных"
  value       = yandex_mdb_postgresql_user.dbuser.name
  sensitive   = true
}

output "db_name" {
  description = "Имя базы данных"
  value       = yandex_mdb_postgresql_database.db.name
  sensitive   = true
}

output "db_password" {
  description = "Пароль администратора базы данных"
  value       = yandex_mdb_postgresql_user.dbuser.password
  sensitive   = true
}

output "db_cluster_id" {
  description = "Идентификатор кластера базы данных"
  value       = yandex_mdb_postgresql_cluster.project-db.id
}

output "db_host" {
  description = "Хост базы данных"
  value       = yandex_mdb_postgresql_cluster.project-db.host.0.fqdn
}

output "instances_info" {
  description = "Необходимые для подключения к виртуальным машинам данные"
  value = [
    for instance in yandex_compute_instance_group.site-ig.instances :
    {
      name : instance.name
      ip : instance.network_interface.0.nat_ip_address
      public_ssh_key : var.public_ssh_key_path
      user : var.yc_vm_user
    }
  ]
}
