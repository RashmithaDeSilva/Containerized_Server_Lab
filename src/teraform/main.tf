# Pulls the image
resource "docker_image" "jenkins_image" {
  name = "jenkins/jenkins:lts"
}

# Create volume
resource "docker_volume" "jenkins_volume" {
  name = "jenkins_volume"
}

# Create a container
resource "docker_container" "jenkins_container" {
  image     = docker_image.jenkins/jenkins.name
  name      = "jenkins_con"
  restart   = "unless stopped"
  volumes {
    volume_name    = docker_volume.jenkins_volume.name
    container_path = "/var/jenkins"
  }
  ports {
    internal = 8080
    external = 8080
  }
}