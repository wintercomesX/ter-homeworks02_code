###cloud vars


variable "cloud_id" {
  type        = string
  default     = "b1gok7td6eko66eb27qa"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = "b1gghnpp51joeriep6bo"
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

###ssh vars

variable "vms_ssh_root_key" {
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICYNA6NYQ46OZl41UMQXj+XZ5gjfkycS4f8I56TVdiGa root@kirill-VirtualBox"
  description = "ssh-keygen -t ed25519"
}

###vm variables
