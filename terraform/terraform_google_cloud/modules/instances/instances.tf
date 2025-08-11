resource "google_compute_instance" "tf-instance-1" {
  name         = "tf-instance-1"
  machine_type = "e2-standard-2"   # match existing machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"  # use existing boot disk image info from GCP
    }
  }

  # network_interface {
  #   network = "default"
  #   access_config {}
  # }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_01
    access_config {}
  }


  metadata_startup_script = <<-EOT
    #!/bin/bash
  EOT

  allow_stopping_for_update = true
}

resource "google_compute_instance" "tf-instance-2" {
  name         = "tf-instance-2"
  machine_type = "e2-standard-2"
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
    }
  }

  # network_interface {
  #   network = "default"
  #   access_config {}
  # }

  network_interface {
    network    = var.network_name
    subnetwork = var.subnet_02
    access_config {}
  }


  metadata_startup_script = <<-EOT
    #!/bin/bash
  EOT

  allow_stopping_for_update = true
}



# resource "google_compute_instance" "tf-instance-3" {
#   name         = "tf-instance-323269"
#   machine_type = "e2-standard-2"
#   zone         = var.zone

#   boot_disk {
#     initialize_params {
#       image = "debian-cloud/debian-11"
#     }
#   }

#   network_interface {
#     network = "default"
#     access_config {}
#   }

#   metadata_startup_script = <<-EOT
#     #!/bin/bash
#   EOT

#   allow_stopping_for_update = true
# }