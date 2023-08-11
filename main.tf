provider "aws" {
  access_key = ""
}


resource "aws_instance" "web" {
  ami           = ami-07e67bd6b5d9fd892
  instance_type = "t3.micro"

  tags = {
    Name = "fld"
  }
}