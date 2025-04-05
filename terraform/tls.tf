# Импорт TLS-сертификата в Certificate Manager
resource "yandex_cm_certificate" "imported-cert" {
  name        = local.cert_name
  description = "TLS certificate for devops-project.com"

  self_managed {
    certificate = var.cert
    private_key = var.cert_private_key
  }
}
