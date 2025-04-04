# Создание сервисного аккаунта для группы ВМ
resource "yandex_iam_service_account" "ig-sa" {
  name        = local.sa_name
  description = "service account to manage IG"
}

resource "yandex_resourcemanager_folder_iam_member" "editor" {
  folder_id = var.yc_folder_id
  role      = "editor"
  member    = "serviceAccount:${yandex_iam_service_account.ig-sa.id}"
}
