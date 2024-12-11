# This code is compatible with Terraform 4.25.0 and versions that are backwards compatible to 4.25.0.
# For information about validating this Terraform code, see https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build#format-and-validate-the-configuration

resource "google_compute_instance" "develite-pro-asia" {
  boot_disk {
    auto_delete = true
    device_name = "develite-pro-asia"

    initialize_params {
      image = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20241115"
      size  = 10
      type  = "pd-balanced"
    }

    mode = "READ_WRITE"
  }

  can_ip_forward      = false
  deletion_protection = false
  enable_display      = false

  labels = {
    goog-ec-src = "vm_add-tf"
  }

  machine_type = "e2-medium"

  metadata = {
    Install-Docker    = "sudo apt-get install docker.io -y\nsudo systemctl start docker\nsudo systemctl enable docker"
    Install-Nginx     = "sudo apt-get install nginx -y"
    Update-the-server = "sudo apt-get update -y"
    ssh-keys          = "damilola_uche:ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDd+h89n4nV195AJJB+DWlLa0mKdBifux6cv8QH1GmL3iZLxv4Ulm7IXBlk/hyk4Y404zGL0DGqWymhVsGU2Zh2ciUXqAkCMUtJ3tupOTE/hCevKDXT3tKZ1PsIfaaTckUdSb+VeNKS0/qyBVabjkh3ssuGAM22DJpuPgMtDTkXIe+EQ16QAwZ1Zy3+OYT1JGHptpWRU+PxgIJq54U1KtxbYFIPlm1CRzGERGMtB26rVrOmRKzjCzOlpGXP6U0HY8UUsbHWfKlPtloCC40PE63AhqNMJoTZmynCME+f48hgnGEcG1T0GYRAD5LIRIhIqjAN3UVcS0tX7jqNLHlw7Y0/s3o7Kzu6racgQfjL+S37dTnHzjWBGvpQ6s8lF7ZK6v8C5SIrKYRoGT0wY/ka+r7Btnx+cWU4upSLRjFT6jfJA2Gg6T25MZS0Lfqm90m4jqbwVKvXVn9QPtSrjbIS3ECIzaff18FP4dolJErWVW9HOwBuQ+AGxKKbqcT51kkz2bkMdQUWHDPKOSK5Guxl2AZvzOTygDMT9zK2Ugvg/DKsxNgVvvf+sHZwBCr07RzXN0+bI85DF9qQxf9RuMccJ6oIvebKKiZRwxQOd80IvpcyM0ZKJqMTkj0WDH+0mKePGhchgb2W0iVQSYnnxcAYc76rGJTfJ7wvHaPQo6gCdRivzw== damilola_uche@UCHE"
    startup-script    = "Startup-script"
  }

  name = "develite-pro-asia"

  network_interface {
    access_config {
      network_tier = "PREMIUM"
    }

    queue_count = 0
    stack_type  = "IPV4_ONLY"
    subnetwork  = "projects/terra-learn-p01/regions/asia-east1/subnetworks/onenet"
  }

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
    preemptible         = false
    provisioning_model  = "STANDARD"
  }

  service_account {
    email  = "docker-ass-key@terra-learn-p01.iam.gserviceaccount.com"
    scopes = ["https://www.googleapis.com/auth/devstorage.read_only", "https://www.googleapis.com/auth/logging.write", "https://www.googleapis.com/auth/monitoring.write", "https://www.googleapis.com/auth/service.management.readonly", "https://www.googleapis.com/auth/servicecontrol", "https://www.googleapis.com/auth/trace.append"]
  }

  shielded_instance_config {
    enable_integrity_monitoring = true
    enable_secure_boot          = true
    enable_vtpm                 = true
  }

  zone = "asia-east1-c"
}
