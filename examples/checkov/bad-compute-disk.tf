# bad-compute-disk.tf
resource "google_compute_disk" "bad_disk" {
  name  = "evil-hello-atl-cloud-conf"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  image = "debian-11-bullseye-v20220719"
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}
