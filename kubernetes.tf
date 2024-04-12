provider "kubernetes" {
    version = "~> 1.10.0"
    host = google.container_cluster.default.endpoint
    token = data.google_client
}