output "test_1" {
  value = {
	vm1 : "${var.vpc_name},${yandex_compute_instance.platform.network_interface[0].nat_ip_address},${yandex_compute_instance.platform.name}"
	vm2 : "${var.vpc_name_2},${yandex_compute_instance.platform2.network_interface[0].nat_ip_address},${yandex_compute_instance.platform2.name}"
  }
}
