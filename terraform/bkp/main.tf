# Definição do provider Docker
terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}
# Criação dos containers
resource "docker_container" "nginx_instance1" {
  name  = "nginx_instance1"
  image = "nginx:latest"
  ports {
    internal = 80
    external = 8080
  }
}

resource "docker_container" "nginx_instance2" {
  name  = "nginx_instance2"
  image = "nginx:latest"
  ports {
    internal = 80
    external = 8081
  }
}

resource "docker_container" "nginx_instance3" {
  name  = "nginx_instance3"
  image = "nginx:latest"
  ports {
    internal = 80
    external = 8082
  }
}

resource "docker_container" "mysql_instance" {
  name  = "mysql_instance"
  image = "mysql:latest"
  ports {
    internal = 3306
    external = 3306
  }
}

resource "docker_container" "mysql_init" {
#resource "docker_container_exec" "mysql_init" {
  container_id = docker_container.mysql_instance.id

  command = [
    "sh",
    "-c",
    "echo -e '[client]\npassword=senha' > /root/.my.cnf && mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e 'CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE}; GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';'"
  ]

  environment = {
    MYSQL_ROOT_PASSWORD = "pucpr"
    MYSQL_DATABASE      = "pucpr"
    MYSQL_USER          = "fellipe"
    MYSQL_PASSWORD      = "pucpr123"
  }
}
