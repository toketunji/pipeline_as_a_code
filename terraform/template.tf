data "template_file" "jenkins_master" {
  template      =       "${file ("cloudinit/jenkins.yml")}"

  vars {
    hostname        =       "${var.app_name}"
    environment     =       "${var.environ}"
    login_user      =       "${var.jenkins_user}"
    login_password  =       "${var.jenkins_password}"
  }
}
