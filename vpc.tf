resource "google_compute_network" "tailscale" {
  name = "tailscale"

  auto_create_subnetworks = false
}

resource "google_compute_subnetwork" "tailscale" {
  name = "tailscale"

  network       = google_compute_network.tailscale.self_link
  ip_cidr_range = var.vpc_subnet_cidr
}
