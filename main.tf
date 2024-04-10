#versions
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

#providers
provider "aws" {
  region = "us-east-1"
}

# Resource - aws -ec2 -jenkins
resource "aws_instance" "jenkins" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  subnet_id              = var.subnet_id
  vpc_security_group_ids = ["sg-0dc7bb6127d56baff"]
  iam_instance_profile   = var.iam_instance_profile
  user_data              = file("C:/Users/shivanand/repo_vcs/project1/project/jenkins.sh")

  tags = {
    Name      = "jenkins"
    CreatedBy = "IaC Terraform"
  }
}

