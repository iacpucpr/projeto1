terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

# Criação das redes isoladas no Docker
resource "null_resource" "create_networks" {
  provisioner "local-exec" {
    command = <<-EOT
      docker network create --subnet=192.168.0.0/24 nginx_network
      docker network create --subnet=172.16.0.0/24 mysql_network
    EOT
  }
}

# Criação dos containers Nginx
resource "docker_container" "nginx_instance1" {
  name  = "nginx_instance1"
  image = "nginx:latest"
  networks_advanced {
    name = "nginx_network"
  }
}

resource "docker_container" "nginx_instance2" {
  name  = "nginx_instance2"
  image = "nginx:latest"
  networks_advanced {
    name = "nginx_network"
  }
}

resource "docker_container" "nginx_instance3" {
  name  = "nginx_instance3"
  image = "nginx:latest"
  networks_advanced {
    name = "nginx_network"
  }
}
