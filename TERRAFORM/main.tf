terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  count = 1
  ami = "ami-0c4f7023847b90238"
  instance_type = "t2.micro"
  subnet_id = "subnet-0d4c75773cc401006"
  key_name = "iac-key-east01"
  tags = {
    Name = "iac-instancia-0${count.index}"
  }
}
