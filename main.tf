# vpc 
resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "my-vpc1"
  }
}
#subnet
resource "aws_subnet" "my_subnet" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "eu-west-3b"

  tags = {
    Name = "pvt-sub"
  }
}

resource "aws_network_interface" "foo" {
  subnet_id   = aws_subnet.my_subnet.id
  private_ips = ["172.16.10.100"]

  tags = {
    Name = "primary_network_interface"
  }
}

#security_groups

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.my_vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.my_vpc.cidr_block]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

# keypairs

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDZQTHKRs8t4SRuMkovgb1H5o1EPQyV2RyCK0JI54EHEpzRH8IAteZxjUUp+pv+eB5cTZVjC5sHfc7nvHw48Xt+mcc13bra0KSaUj73PE459zx0CLyGla19E8BjyLDsHT8WCjpb4IQZ+0wb1ZFctmqvh01UW9AY+hJwhe6Q8/D0rRWa2q8cAUms83nJOrdhshyJmOIhVxF+wEDYILEOA+0NrOO/BLLFUPiC33MprewbhLGodrZW0vT7wvwwjt3Uh85aMJGcvBRSl46I1xV82tgZCl5Qo6AIYJ/OIKjB0s44/ut3xiFynGdDmXYlTjyVQ49f7QGD/ayBOLmAv7JOl6mQXVMbrS0b98c6x2DNBnenJbz8PoMZ9kZKz9rnq+DMQzluROJsQsK2wZ4kvhDX7xRIXDDIgBIpYDL4ONzNul/CJ2PY4LKuV+JIo220BZjDqj8+PKk6QxdfKHnl+5GItrVSnven3BmKXNlTI1lxeLid/Cv+U3vXJipfk9vVJkPffeE= root@DESKTOP-FRCJL64"
}
 

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_eip" "samplep" {
    instance = aws_instance.rs4.id
    
}   
#vm 

resource "aws_instance" "rs4" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = aws_subnet.my_subnet.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  key_name = aws_key_pair.deployer.id
  tags = {
    Name = "eip"