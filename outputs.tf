output "custom_vm_module" {
  value = google_compute_instance.my_instance.id
  description = "The ID of the VM"
}