variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable image_id {
  description = "Disk image"
}
variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key .json"
}

variable "private_key_for_conn_provisioner" {
  description = "private_key_for_conn_provisioner"
}

variable "app_instances_count" {
  default = 1
}

variable "external_app_port" {
  default = 8080
}
variable "internal_app_port" {
  default = 9292
}

variable "enable_provision" {
  default = true
}

variable "image_to_run" {
  description = "Docker image to run"
  default     = ""
}
