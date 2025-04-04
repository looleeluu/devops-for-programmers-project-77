# Создание облачной сети
resource "yandex_vpc_network" "network" {
  name = local.network_name
}

resource "yandex_vpc_subnet" "subnet" {
  name           = local.subnet_name
  zone           = var.yc_compute_default_zone
  v4_cidr_blocks = ["192.168.1.0/24"]
  network_id     = yandex_vpc_network.network.id
}

# Создание статического публичного IP-адреса
resource "yandex_vpc_address" "stat_address" {
  name = "alb-static-address"
  external_ipv4_address {
    zone_id = var.yc_compute_default_zone
  }
}
