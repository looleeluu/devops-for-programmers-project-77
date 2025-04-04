# Группа виртуальных машин
resource "yandex_compute_instance_group" "site-ig" {
  name               = local.site_ig_name
  folder_id          = var.yc_folder_id
  service_account_id = yandex_iam_service_account.ig-sa.id

  instance_template {
    platform_id = "standard-v1"
    resources {
      memory = 2
      cores  = 2
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = "fd82vchjp2kdjiuam29k"
      }
    }

    network_interface {
      network_id         = yandex_vpc_network.network.id
      subnet_ids         = [yandex_vpc_subnet.subnet.id]
      security_group_ids = [yandex_vpc_security_group.sg-vms.id]
      nat                = true
    }

    metadata = {
      user-data = "#cloud-config\nusers:\n  - name: ${var.yc_vm_user}\n    groups: sudo\n    shell: /bin/bash\n    sudo: 'ALL=(ALL) NOPASSWD:ALL'\n    ssh_authorized_keys:\n      - '${var.yc_ssh_key}'\n"
    }

    scheduling_policy {
      preemptible = false # Если нужно, можно включить прерываемые машины
    }
  }

  timeouts {
    create = "30m"
    update = "30m"
    delete = "30m"
  }

  scale_policy {
    fixed_scale {
      size = 2
    }
  }

  allocation_policy {
    zones = [var.yc_compute_default_zone]
  }

  application_load_balancer {
    target_group_name = local.alb_name
  }

  deploy_policy {
    max_unavailable = 1 # Максимальное количество недоступных машин при обновлении
    max_expansion   = 0
  }
}
