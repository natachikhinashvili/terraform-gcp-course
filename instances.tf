
resource "google_service_account" "default" {
    account_id = ""
}

resource "google_compute_backend_service" "default"{
    name = "${variable.instancename}1"
}