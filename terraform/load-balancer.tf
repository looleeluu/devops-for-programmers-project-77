# Создание L7-балансировщика
resource "yandex_alb_load_balancer" "alb" {
  name               = local.alb_name
  network_id         = yandex_vpc_network.network.id
  security_group_ids = [yandex_vpc_security_group.sg-balancer.id]

  allocation_policy {
    location {
      zone_id   = var.yc_compute_default_zone
      subnet_id = yandex_vpc_subnet.subnet.id
    }
  }

  listener {
    name = "list-http"
    endpoint {
      address {
        external_ipv4_address {
          address = yandex_vpc_address.stat_address.external_ipv4_address[0].address
        }
      }
      ports = [80]
    }
    http {
      redirects {
        http_to_https = true
      }
    }
  }

  listener {
    name = "listener-http"
    endpoint {
      address {
        external_ipv4_address {
          address = yandex_vpc_address.stat_address.external_ipv4_address[0].address
        }
      }
      ports = [443]
    }
    tls {
      default_handler {
        http_handler {
          http_router_id = yandex_alb_http_router.alb-router.id
        }
        certificate_ids = [yandex_cm_certificate.imported-cert.id]
      }
      sni_handler {
        name         = "mysite-sni"
        server_names = ["${var.domain}"]
        handler {
          http_handler {
            http_router_id = yandex_alb_http_router.alb-router.id
          }
          certificate_ids = [yandex_cm_certificate.imported-cert.id]
        }
      }
    }
  }
}