variable "region" {
  description = "AWS Region"
  default     = "us-west-2"
}

variable "key_path" {
  description = "Public key path"
  default     = "/home/devops/.ssh/id_rsa.pub" # key path setup for EC2 Instnace
}

variable "ami" {
  description = "AMI"
  default     = "ami-003634241a8#####" #AMI
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro" # chnage the what is your reqiurment
}
