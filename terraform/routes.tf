// add GCP route to vpc network
resource "google_compute_route" "route" {
    name                   = "${var.name}-route"
    dest_range             = "0.0.0.0/0"
    network                = "${google_compute_network.vpc.self_link}"
    // next_hop_instance      = "${element(google_compute_firewall.*.name, count.index)}"
    next_hop_instance_zone = "${var.zone}"
    priority               = 100

    depends_on = [
        "google_compute_network.vpc"
    ]
}