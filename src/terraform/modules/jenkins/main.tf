resource "docker_container" "jenkins_container" {
  image = var.container_image
  name  = var.container_name
  restart   = "unless stopped"
  volumes {
    volume_name    = var.volume_name
    container_path = "/var/jenkins"
  }
  ports {
    internal = 8080
    external = 8080
  }
}
