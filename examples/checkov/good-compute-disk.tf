# good-compute-disk.tf
resource "google_compute_disk" "good_disk" {
  name  = "nice-hello-atl-cloud-conf"
  type  = "pd-ssd"
  zone  = "us-central1-a"
  image = "debian-11-bullseye-v20220719"
  disk_encryption_key {
    raw_key = base64encode("fake-key!")
  }
  labels = {
    environment = "dev"
  }
  physical_block_size_bytes = 4096
}
