output "lamp-server-ip" {
    value = "${google_compute_instance.lamp_instance.network_interface.1.address}"
}