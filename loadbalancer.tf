module "gce-lb-fr" {
    source = "github.com/GoogleCloudPlatformm/terraform-google-lb"
    region = "${var.region}"
    name = "group1-lb"
    service_port = "${module.mig1.service_port}"
    source_tags = ["${module.mig1.target_tags}"]
    target_tags = ["${module.mig2.target_tags}", "${module.mig3.target_tags}"]
    backends = [
        { group = "${module.mig2.instance_group}" },
        { group = "${module.mig3.instance_group}" }
    ]
}