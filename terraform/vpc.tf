//create vpc resource
resource "google_compute_network" "vpc" {
    name                    = "${var.name}-vpc"
    auto_create_subnetworks = "false"
}