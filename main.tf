provider "aws" {
  access_key = "AKIAXQ4632KKL5RUFEXO"
  secret_key = "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"
  region     = "eu-west-3"
}

resource "aws_instance" "web" {
  ami           = "ami-08a52ddb321b32a8c"
  instance_type = "t3.micro"

  tags = {
    Name = "fld"
  }
}
