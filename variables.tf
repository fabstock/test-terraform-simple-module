

variable "ami" {
  description = "AMI pour l'instance EC2."
  type        = string
  default     = "ami-03cf127a"
}

variable "instance_type" {
  description = "type d'instance EC2."
  type        = string
  default     = "t2.micro"
}




variable "aws_region" {
  description = "Region"
  type = string
  default = "us-east-1"
}

variable "instance_name" {
  description = "Nom EC2 instance"
  type        = string
  #default     = "ExampleAppServerInstance"
  default = "kiki"

}

variable "production_vpc_cidr" {
description = "cidr_block"
type= string
default = "10.111.1.0/24"

}


variable "test_vpc_cidr" {
description = "cidr_block"
type= string
default = "10.222.2.0/24"

}




variable "azs" {
 type        = list(string)
 description = "Availability Zones"
 default     = ["eu-central-1a", "eu-central-1b", "eu-central-1c"]
}



variable "public_subnet_cidrs" {
 type        = list(string)
 description = "Public Subnet CIDR values"
 default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}
 
variable "private_subnet_cidrs" {
 type        = list(string)
 description = "Private Subnet CIDR values"
 default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}


/*

variable "vpc_id" {
  description = "ID du VPC dans lequel l'instance sera lancée."
  type        = string
  #default =  "vpc-bf893fc2" # aws ec2  describe-security-groups
  create = true

}

variable "subnet_id" {
  description = "ID du subnet dans lequel l'instance sera lancée."
  type        = string
  #default = "subnet-1a0bf17f"
  default = vpc_id
  create = true
}

variable "security_group_id" {
  description = "ID du groupe de sécurité à appliquer à l'instance."
  type        = string
  #default  = "sg-5530f61710073bfb8"
  #default  = security_group_id
  default  = "main"
}

*/

