resource "google_compute_instance" "web-instances"{
    count = 3
    name = "web${count.index}"
    machine_type = "f1-micro"
    labels = {
        environment = "DEV"
    }
    boot_disk {
        initialize_params {
            image = "debian-cloud/debian-11"
        }
    }

    network_interface {

    }
}

variable "environment_instance_settings" {S
    type = map(object({machine_type=string, labels=map(string)}))
    default = {
        "DEV" = {
            machine_type
        }
    }
}

resource "google_compute_instances" "web-map-instances" {
    for_each = var.environment_instance_settings
    name = "${lower(each.key)}-web"
}