variable "region"{
    default = "eu-west-3"
}

variable "terraform-backend"{
    default = "amazon-mqa-b6"
}



variable "vpc_cidr"{
    default = "10.10.0.0/16"
}

variable "env"{ 
    default = "dev"
}

variable "pri_sub_cidr"{
    default = "10.10.0.0/20"
}
variable "az1"{
    default = "eu-west-3a"
}

variable "az2"{
    default = "eu-west-3b"
}

variable "project"{
    default = "cbz"
}
variable "pub_sub_cidr"{
    default = "10.10.16.0/20"
}    

variable "image_id"{
    default = "ami-07e67bd6b5d9fd892"
}

variable "instance_type"{
    default = "t2.micro"
}

variable "key_pair"{
    default = "id_rsa"
}