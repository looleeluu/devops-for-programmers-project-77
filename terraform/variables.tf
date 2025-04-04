variable "domain" {
  description = "Домен для создания ресурсов"
  type        = string
}

variable "dd_api_key" {
  description = "API ключ Datadog"
  type        = string
  sensitive   = true
}

variable "dd_app_key" {
  description = "App ключ Datadog"
  type        = string
  sensitive   = true
}

variable "public_ssh_key_path" {
  description = "Путь к SSH ключу для подключения к ВМ"
  type        = string
}

variable "yc_token" {
  description = "OAuth-токен"
  type        = string
  sensitive   = true
}

variable "yc_folder_id" {
  description = "ID папки"
  type        = string
  sensitive   = true
}

variable "yc_cloud_id" {
  description = "ID облака"
  type        = string
  sensitive   = true
}

variable "yc_compute_default_zone" {
  description = "Зона по умолчанию для создания ресурсов"
  type        = string
}

variable "tc_token" {
  description = "Terraform Cloud API token"
  type        = string
  sensitive   = true
}

variable "yc_vm_user" {
  description = "Пользователь для подключения к ВМ"
  type        = string
}

variable "yc_ssh_key" {
  description = "SSH ключ для подключения к ВМ"
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "Имя базы данных"
  type        = string
}

variable "db_password" {
  description = "Пароль для базы данных"
  type        = string
  sensitive   = true
}

variable "db_user" {
  description = "Пользователь базы данных"
  type        = string
}
