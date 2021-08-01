resource "google_compute_instance" "tailscale" {
  name                    = "tailscale"
  machine_type            = var.instance_type
  metadata_startup_script = sensitive(data.template_file.startup_script.rendered)

  boot_disk {
    initialize_params {
      type  = "pd-standard"
      size  = 40
      image = "ubuntu-2004-lts"
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.tailscale.self_link
  }

  shielded_instance_config {
    enable_secure_boot = true
  }

}

data "template_file" "startup_script" {
  template = file("${path.module}/startup_script.sh.tpl")

  vars = {
    authkey  = var.tailscale_auth_key
    hostname = var.hostname
  }
}
