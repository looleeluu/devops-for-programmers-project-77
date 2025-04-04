# Создание HTTP-роутера
resource "yandex_alb_http_router" "alb-router" {
  name = local.alb_router_name
}

resource "yandex_alb_virtual_host" "alb-host" {
  name           = local.alb_host_name
  authority      = ["${var.domain}"]
  http_router_id = yandex_alb_http_router.alb-router.id
  route {
    name = "alb-route"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.alb-bg.id
        timeout          = "60s"
      }
    }
  }
}
