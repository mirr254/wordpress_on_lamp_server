//we create 2 subnets for our vpc
resource "google_compute_subnetwork" "public_subnet" {
    name          = "${var.name}-private-subnet"
    ip_cidr_range = "${var.public_subnet_cidr}"
    network       = "${var.name}-vpc"
    depends_on    = ["google_compute_network.vpc"]
    region        = "${var.region}"
}

resource "google_compute_subnetwork" "private_subnet" {
    name          = "${var.name}-private-subnet"
    ip_cidr_range = "${var.private_subnet_cidr}"
    network       = "${var.name}-vpc"
    depends_on    = ["google_compute_network.vpc"]
    region        = "${var.region}"
}