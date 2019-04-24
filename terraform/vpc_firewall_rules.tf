resource "google_compute_firewall" "firewall" {
    name     = "${var.name}-allow-https-firewall"
    network  = "${google_compute_network.vpc.name}"

    allow {
        protocol = "icmp"
    }

    allow {
        protocol = "tcp"
        ports    = ["443"]
    }

    source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_http" {
    name    = "${var.name}-allow-http-firewall"
    network = "${google_compute_network.vpc.name}"

    allow {
        protocol = "tcp"
        ports    = ["80"]
    }

    source_ranges = ["0.0.0.0/0"]
    
    target_tags = ["http"]
}

// this was not working since https traffic is not being alllowed when
// creating the instance firewall

//when allowed on console it works fine
