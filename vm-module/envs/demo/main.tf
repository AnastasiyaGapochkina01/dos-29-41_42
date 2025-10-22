terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.84"
    }
  }
}

provider "yandex" {
  token     = "${var.yc_token}"
  cloud_id  = "${var.yc_cloud_id}"
  folder_id = "${var.yc_folder_id}"
}

module "web_server" {
  source = "../../modules/yc-vm"

  vm_name       = "prod-web"
  cores         = 2
  memory        = 2
  disk_size     = 25
  subnet_id     = yandex_vpc_subnet.prod.id
  public_key_path = "~/.ssh/id_ed25519.pub"
}

resource "yandex_vpc_network" "prod" {
  name = "prod-network"
}

resource "yandex_vpc_subnet" "prod" {
  name           = "prod-subnet"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.prod.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

variable "yc_token" {}
variable "yc_cloud_id" {}
variable "yc_folder_id" {}
