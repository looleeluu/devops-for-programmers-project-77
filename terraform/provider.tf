terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

provider "yandex" {
  zone      = "ru-central1-d"
  token     = var.yc_token
  folder_id = var.yc_folder_id
  cloud_id  = var.yc_cloud_id
}

provider "datadog" {
  api_key = var.dd_api_key
  app_key = var.dd_app_key
  api_url = "https://api.datadoghq.eu/"
}