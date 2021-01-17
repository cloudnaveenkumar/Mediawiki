provider "aws" {
  region = "${var.region}"
}

resource "aws_security_group" "default" {
  name = "ec2-sg"

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # will be change on infrastructure lavel
  }

  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # will be change on infrastructure lavel
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"] # will be change on infrastructure lavel
  }
}

resource "aws_key_pair" "default" {
  key_name   = "ec2-key"
  public_key = "${file("${var.key_path}")}"
}

resource "aws_instance" "server" {
  ami             = "${var.ami}"
  instance_type   = "${var.instance_type}"
  key_name        = "${aws_key_pair.default.id}"
  security_groups = ["${aws_security_group.default.name}"]
  user_data       = "${file("install.sh")}"

}
