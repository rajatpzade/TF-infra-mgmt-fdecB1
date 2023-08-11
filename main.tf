resource "aws_instance" "web" {
  ami           = ami_id
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}