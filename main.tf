terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {
  # HINT: docker context ls 
}

resource "docker_image" "image" {
  name         = "louislam/uptime-kuma"
  keep_locally = false
}

resource "docker_container" "container" {
  image = docker_image.image.image_id
  name  = "up-time-kuma"

  ports {
    internal = 3001
    external = 3001
  }
}

