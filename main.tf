provider "aws" {
  access_key = "AKIAXQ4632KKL5RUFEXO"
  secret_key = "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"
  region     = "eu-west-3"
}

terraform {
  backend =
}

resource "aws_instance" "web" {
  ami           = "ami-07e67bd6b5d9fd892"
  instance_type = "t3.micro"

  tags = {
    Name = "fld"
  }
}
