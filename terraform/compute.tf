resource "google_compute_instance" "lamp_instnace" {
    boot_disk {
        initialize_params {
            image = "${data.google_compute_image.lamp_image.self_link}"
        }
    }
}