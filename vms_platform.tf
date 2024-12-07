###cloud vars 1

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}

###vm vars 1

variable "vm_web_ubuntu" {
  default = "ubuntu-2004-lts"
}

variable "vm_web_name_ubuntu" {
  default = "netology-develop-platform-web"
}

###cloud vars 2

variable "default_zone_b" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vpc_name_2" {
  type        = string
  default     = "develop2"
  description = "VPC network & subnet name"
}

###vm vars 2

variable "vm_db_ubuntu" {
  default = "ubuntu-2004-lts"
}

variable "vm_db_name_ubuntu" {
  default = "netology-develop-platform-db"
}

###map objects

variable "vms_resources" {
  type = map(object({
	cores = number
	memory = number
	core_fraction = number
	hdd_size = number
	hdd_type = string
  }))
  default = {
	web = {
	  cores = 2
	  memory = 2
	  core_fraction = 5
	  hdd_size = 10
	  hdd_type = "network-hdd"
	},
	db = {
          cores = 2
          memory = 2
          core_fraction = 5
          hdd_size = 10
          hdd_type = "network-ssd"
	}
  }
}

###metadata
variable "metadata" {
  type = map(string)

  default = {
	"serial-port-enable" = "1"
	"ssh-keys" = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICYNA6NYQ46OZl41UMQXj+XZ5gjfkycS4f8I56TVdiGa root@kirill-VirtualBox"
  }


}
