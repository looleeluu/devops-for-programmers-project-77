# Создание группы бэкендов
resource "yandex_alb_backend_group" "alb-bg" {
  name = local.alb_bg_name

  http_backend {
    name             = "alb-backend"
    weight           = 1
    port             = 80
    target_group_ids = [yandex_compute_instance_group.site-ig.application_load_balancer[0].target_group_id]

    healthcheck {
      timeout          = "10s"
      interval         = "2s"
      healthcheck_port = 80
      http_healthcheck {
        path = "/"
      }
    }
  }
}