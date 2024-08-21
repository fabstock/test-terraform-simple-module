variable "vpc_id" {
 description = "ID du VPC dans lequel l'instance sera lancée."
  type        = string
  #default =  "vpc-bf893fc2" # aws ec2  describe-security-groups
  #create = true

}




variable "name" {

 description = "ID du VPC dans lequel l'instance sera lancée."
  type        = string
  #default =  "vpc-bf893fc2" # aws ec2  describe-security-groups


}

resource "aws_subnet" "public" {
    vpc_id = "${var.vpc_id}"
}

