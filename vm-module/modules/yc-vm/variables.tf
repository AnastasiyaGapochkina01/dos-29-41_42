variable "vm_name" {
  type        = string
}

variable "cores" {
  type        = number
  default     = 2
}

variable "memory" {
  type        = number
  default     = 2
}

variable "disk_size" {
  type        = number
  default     = 20
}

variable "image_id" {
  type        = string
  default     = "fd827b91-99dc-4c7b-a3ee-8e5a2a6e4a3d" # Ubuntu 20.04
}

variable "subnet_id" {
  type        = string
}

variable "zone" {
  type        = string
  default     = "ru-central1-b"
}

variable "enable_nat" {
  type        = bool
  default     = true
}

variable "public_key_path" {
  type        = string
}
