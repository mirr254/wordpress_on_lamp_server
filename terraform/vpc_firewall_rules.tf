resource "google_compute_firewall" "firewall" {
    name     = "${var.name}-firewall"
    network  = "${google_compute_network.vpc.name}"

    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports    = ["22", "443"]
    }

    source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_http" {
    name    = "${var.name}-http-firewall"
    network = "${google_compute_network.vpc.name}"

    allow {
        protocol = "tcp"
        ports    = ["80"]
    }
    target_tags = ["http"]
}