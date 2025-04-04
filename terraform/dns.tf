resource "yandex_dns_zone" "alb-zone" {
  name        = local.alb_zone_name
  description = "Public zone"
  zone        = "${var.domain}."
  public      = true
}

resource "yandex_dns_recordset" "alb-record" {
  zone_id = yandex_dns_zone.alb-zone.id
  name    = "${var.domain}."
  ttl     = 600
  type    = "A"
  data    = [yandex_alb_load_balancer.alb.listener[0].endpoint[0].address[0].external_ipv4_address[0].address]
}