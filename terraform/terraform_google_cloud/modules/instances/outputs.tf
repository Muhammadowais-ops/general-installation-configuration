output "instance_names_tf1" {
  value = google_compute_instance.tf-instance-1.name
}

output "instance_names_tf2" {
  value = google_compute_instance.tf-instance-2.name
}