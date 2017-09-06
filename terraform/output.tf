output "vpc" {
    value = "${aws_vpc.pipeline.id}"
}

output "public_IPs" {
  value  = "${join (",",aws_instance.jenkins_masters.*.public_ip)}"
}
