terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}


# resource "terraform_data" "example" {}

data "external" "example" {
  program = ["python3", "-c", "import json, sys, subprocess; result = subprocess.run(['touch', 'success'], capture_output=True, text=True); json.dump({'stdout': result.stdout, 'stderr': result.stderr, 'returncode': str(result.returncode)}, sys.stdout)"]
}

#resource "aws_instance" "example" {
#  ami           = "ami-0fb653ca2d3203ac1"
#  instance_type = "t2.micro"
#}
