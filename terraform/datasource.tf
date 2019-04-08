data "google_compute_image" "lamp_image" {
    //family returns the latest image that is part of an image family and is not deprecated
    family = "wordpress-on-lamp-img" 
    project = "${var.gcp_projects}"

}