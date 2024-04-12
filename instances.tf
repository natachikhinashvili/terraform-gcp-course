resource "google_service_account" "default" {
    account_id = ""
}

resource "google_compute_instance_group" "example" {
  name        = "example-instance-group"
  description = "Example instance group"
  zone        = "your-zone"

  instances = [
    "instance-1",
    "instance-2",
    # Add more instance names as needed
  ]
}

resource "google_compute_backend_service" "default" {
  name                  = "tf-test-backend-service-external"
  machine_type          = "n2-standard-2"
  boot_disk {
    initialize_params {
        image = "your-image-url"
    }
  }
  network_interface {
    network = "default"
  }
  backend {
    group = google_compute_instance_group.example.self_link
  }
  metadata_startup_script = <<-EOT
        #!/bin/bash
        # Add your startup script commands here
    EOT
  allow_stopping_for_update = true
}
