//we create a subnet for our vpc
resource "google_compute_subnetwork" "subnet" {
    name          = "${var.name}-sunetwork"
    ip_cidr_range = "${var.subnet_cidr}"
    network       = "${var.name}-vpc"
    depends_on    = ["google_compute_network.vpc"]
    region        = "${var.region}"
}