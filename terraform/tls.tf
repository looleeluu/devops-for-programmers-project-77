# Импорт TLS-сертификата в Certificate Manager
resource "yandex_cm_certificate" "imported-cert" {
  name        = local.cert_name
  description = "TLS certificate for devops-project.com"

  self_managed {
    certificate = file("./certificate.crt")
    private_key = file("./certificate.key")
  }
}
