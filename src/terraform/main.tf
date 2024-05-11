# Pulls the image
resource "docker_image" "jenkins_image" {
  name = "jenkins/jenkins:lts"
}
resource "docker_image" "portainer_image" {
  name = "portainer/portainer-ce:latest"
}


# Create volume
resource "docker_volume" "jenkins_volume" {
  name = "jenkins_data"
}
resource "docker_volume" "portainer_volume" {
  name = "portainer_data"
}


# Create a container
resource "docker_container" "jenkins_container" {
  image     = docker_image.jenkins_image.name
  name      = "jenkins"
  restart   = "unless-stopped"
  tty         = true
  stdin_open = true
  start       = true
  volumes {
    volume_name    = docker_volume.jenkins_volume.name
    container_path = "/var/jenkins_home"
  }
  ports {
    internal = 8080
    external = 8080
  }
}
resource "docker_container" "portainer_container" {
  image     = docker_image.portainer_image.name
  name      = "portainer"
  restart   = "always"
  tty         = true
  stdin_open = true
  start       = true
  ports {
    internal = 8000
    external = 8000
  }
  ports {
    internal = 9443
    external = 9443
  }
  volumes {
    volume_name    = docker_volume.portainer_volume.name
    container_path = "/data"
  }
  volumes {
    host_path      = "/var/run/docker.sock"
    container_path = "/var/run/docker.sock"
  }
}