resource "google_compute_instance" "lamp_instance" {
    name         = "${var.name}-word-lamp-instance"
    machine_type = "${var.machine_type}"
    zone         = "${var.zone}"

    boot_disk {
        initialize_params {
            image = "${data.google_compute_image.lamp_image.self_link}"
        }
    }

    metadata {
        startup-script = <<SCRIPT
        apt-get -y update
        apt-get -y install nginx
        export HOSTNAME=$(hostname | tr -d '\n)
        export PRIVATE_IP=$(curl -sf -H 'Metadata-Flavor:Google' http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip | tr -d '\n')
        echo "Elcome to $HOSTNAME - $PRIVATE_IP" >
        
        SCRIPT
    }

    network_interface {
        network    ="${google_compute_network.vpc.name}"
        subnetwork = "${google_compute_subnetwork.subnet.name}"
    }

}