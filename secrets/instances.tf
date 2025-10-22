resource "yandex_compute_instance" "balancer-1" {
  name = "yc-balancer-1"
  platform_id = "standard-v3"

  resources {
    cores = var.default_cpu
    memory = var.default_mem
  }

  boot_disk {
    initialize_params {
      image_id = var.default_image
      size = var.default_disk_size
    }
  }

  network_interface {
    subnet_id = "e2lcmpigub6jp4jl52n7"
    nat       = true
  }

  metadata = {
    user-data = "${file("./users.txt")}"
  }
}
