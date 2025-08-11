provider "google" {
  project = var.project_id
  region  = var.region
}

terraform {
  backend "gcs" {
    bucket  = "tf-bucket-751392"
    prefix  = "terraform/state"
  }
}


module "vpc_network" {
  source  = "terraform-google-modules/network/google"
  version = "10.0.0"

  project_id     = var.project_id
  network_name   = "tf-vpc-640153"
  routing_mode   = "GLOBAL"

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-east4"
    },
    {
      subnet_name   = "subnet-02"
      subnet_ip     = "10.10.20.0/24"
      subnet_region = "us-east4"
    }
  ]
}

resource "google_compute_firewall" "tf-firewall" {
  name    = "tf-firewall"
  network = module.vpc_network.network_name  # or module.vpc_network.network_self_link if needed

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]

  direction = "INGRESS"
  priority  = 1000
  target_tags = []  # optional, empty means applies to all instances in network
}



module "instances" {
  source     = "./modules/instances"

  network_name = module.vpc_network.network_name

  subnet_01 = module.vpc_network.subnets["us-east4/subnet-01"].name
  subnet_02 = module.vpc_network.subnets["us-east4/subnet-02"].name

  zone = var.zone
}

module "storage" {
  source     = "./modules/storage"
  storage_name = var.storage_name
}
