###############################
# Security group Definitions  #
###############################


#security access for the jenkins
resource "aws_security_group" "jenkins" {
  name          =       "${var.owner}-jenkins"
  vpc_id        =       "${aws_vpc.pipeline.id}"


  # Allow SSH remote access
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }


  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  tags {
      Name  = "jenkins_tag"
      owner = "${var.owner}"
  }
}
