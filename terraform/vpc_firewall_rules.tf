resource "google_compute_firewall" "firewall" {
    name     = "${var.name}-firewall"
    network  = "${var.name}-vpc"

    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports    = ["22", "443"]
    }

    source_ranges = ["0.0.0.0/0"]
}