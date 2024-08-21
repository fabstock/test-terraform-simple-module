


 resource "aws_instance" "my_instance" {
   #ami           = "ami-08d70e59c07c61a3a"
   #instance_type = "t2.micro"
   ami           = var.ami
   instance_type = var.instance_type
   #subnet_id     = "private_subnets"
   #subnet_id     = "private_subnet_cidrs"

   


  #security_group = module.security_group.security_group_id
  #key_name               = var.key_name
  #security_group_id = [aws_security_group.main.id]
  #vpc_security_group_ids = [aws_security_group.security_group_id]



   tags = {
#    Name = "ExampleAppServerInstance"
     Name = var.instance_name
   }
 }










resource "aws_subnet" "public_subnets" {
 count             = length(var.public_subnet_cidrs)
 vpc_id            = aws_vpc.main.id
 cidr_block        = element(var.public_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "Public Subnet ${count.index + 1}"
 }
}
 
resource "aws_subnet" "private_subnets" {
 count             = length(var.private_subnet_cidrs)
 vpc_id            = aws_vpc.main.id
 cidr_block        = element(var.private_subnet_cidrs, count.index)
 availability_zone = element(var.azs, count.index)
 
 tags = {
   Name = "Private Subnet ${count.index + 1}"
 }
}




resource "aws_internet_gateway" "gw" {
 vpc_id = aws_vpc.main.id
 
 tags = {
   Name = "Project VPC IG"
 }
}



resource "aws_route_table" "second_rt" {
 vpc_id = aws_vpc.main.id
 
 route {
   cidr_block = "0.0.0.0/0"
   gateway_id = aws_internet_gateway.gw.id
 }
 
 tags = {
   Name = "2nd Route Table"
 }
}




resource "aws_route_table_association" "public_subnet_asso" {
 count = length(var.public_subnet_cidrs)
 subnet_id      = element(aws_subnet.public_subnets[*].id, count.index)
 route_table_id = aws_route_table.second_rt.id
}


