resource "google_compute_instance" "lamp_instance" {
    name         = "${var.name}-word-lamp-instance"
    machine_type = "${var.machine_type}"
    zone         = "${var.zone}"

    boot_disk {
        initialize_params {
            image = "${data.google_compute_image.lamp_image.self_link}"
        }
    }

    network_interface {
        network    ="${google_compute_network.vpc.id}"
        subnetwork = "${google_compute_subnetwork.subnet.id}"
    }

}