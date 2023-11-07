terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "ap-southeast-1"
}

resource "aws_instance" "InstanceToMonitor" {
  ami           = "ami-0df7a207adb9748c7"
  instance_type = "t2.micro"
  key_name = "tf_key"

  tags = {
    Name = "InstanceToMonitor"
  }
}

resource "aws_instance" "Snort" {
    ami             = "ami-0df7a207adb9748c7"
    instance_type   = "t2.micro"
    key_name = "tf_key"

    tags = {
      Name = "Snort"
    }
}

resource "aws_instance"  "ELKstack"{
    ami             = "ami-0df7a207adb9748c7"
    instance_type = "t2.micro"
    key_name = "tf_key"

    tags = {
      Name = "ELKstack"
    }
}

data "aws_vpc" "default_vpc"{
  default = true
}

data "aws_subnet_ids" "default_vpc"{
  vpc_id = data.aws_vpc.default_vpc.id
}
