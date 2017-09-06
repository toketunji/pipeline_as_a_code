###########
# NETWORK #
###########

resource "aws_vpc" "pipeline" {
  cidr_block      =   "${var.vpc_cidr}"
  tags {
          Name    =   "${var.app_name}-${var.environ}"
          owner   =   "${var.owner}"
          environ =   "${var.environ}"
  }
}

resource "aws_internet_gateway" "default" {
    vpc_id    =   "${aws_vpc.pipeline.id}"
    tags {
      Name    =   "${var.app_name}-${var.environ}_Jenkind_IGW"
      owner   =   "${var.owner}"
    }
}

resource  "aws_route_table" "main_table" {
  vpc_id    =   "${aws_vpc.pipeline.id}"
  route {
    cidr_block    =   "0.0.0.0/0"
    gateway_id    =   "${aws_internet_gateway.default.id}"
  }
}


resource  "aws_subnet" "jenkins_public" {
    vpc_id            =   "${aws_vpc.pipeline.id}"
    cidr_block        =   "${cidrsubnet(var.vpc_cidr,var.subnet_bits, 1) }"
    availability_zone =   "${var.region}${element (split (",",  lookup (var.azs, var.region ) ) , 1) }"
    tags {
      Name            =   "main_subnet"
    }
}


resource "aws_route_table_association" "jenkins_public" {
  subnet_id             =       "${element ( aws_subnet.jenkins_public.*.id, count.index)}"
  route_table_id        =       "${aws_route_table.main_table.id}"
  count                 =       "${length( split ( ",", lookup (var.azs, var.region ) ) ) }"
}



