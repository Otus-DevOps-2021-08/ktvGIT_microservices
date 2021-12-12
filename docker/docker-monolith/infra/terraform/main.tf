provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}


resource "yandex_compute_instance" "app" {

 count = var.app_instances_count
#  name = "reddit-app${count.index}"
name = "docker-host-app${count.index}"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      # Указать id образа созданного в предыдущем домашем задании
      image_id = var.image_id
    }
  }

  network_interface {
    # Указан id подсети default-ru-central1-a
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }


  connection {
    type  = "ssh"
    # host  = yandex_compute_instance.app.network_interface.0.nat_ip_address
    host  = self.network_interface[0].nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    # private_key = file("~/.ssh/ubuntu")
    private_key = file(var.private_key_for_conn_provisioner)
  }




  provisioner "remote-exec" {
  inline = [
      var.enable_provision ? "chmod +x /tmp/deploy.sh && /tmp/deploy.sh ${var.image_to_run} && rm -f /tmp/deploy.sh" : "cat /dev/null"
    ]

  }



}
