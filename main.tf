resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_ubuntu
}
resource "yandex_compute_instance" "platform" {
  name        = local.name1
  platform_id = "standard-v3"
  resources {
    cores         = var.vms_resources.web.cores
    memory        = var.vms_resources.web.memory
    core_fraction = var.vms_resources.web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}

resource "yandex_vpc_network" "develop2" {
  name = var.vpc_name_2
}
resource "yandex_vpc_subnet" "develop2" {
  name           = var.vpc_name_2
  zone           = var.default_zone_b
  network_id     = yandex_vpc_network.develop2.id
  v4_cidr_blocks = var.default_cidr
}


data "yandex_compute_image" "ubuntu2" {
  family = var.vm_db_ubuntu
}
resource "yandex_compute_instance" "platform2" {
  name        = local.name2
  platform_id = "standard-v3"
  resources {
    cores         = var.vms_resources.db.cores
    memory        = var.vms_resources.db.memory
    core_fraction = var.vms_resources.db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = var.metadata
}



