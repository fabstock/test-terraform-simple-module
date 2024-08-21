

output "instance_id" {
  value = aws_instance.my_instance.id
}

output "instance_name" {

  value = "aws_instance.my_instance.instance_name"
}


output "public_ip" {
  value = aws_instance.my_instance.public_ip
}


output "private_ip" {
  value = aws_instance.my_instance.private_ip
}

output "ami" {
  value = aws_instance.my_instance.ami
}


output "instance_type" {
  value = aws_instance.my_instance.instance_type
}


output "aws_region" {
 #value = data.aws_region.current.name
  value = "${data.aws_region.current.name}"
}


output "vpc_id" {
 value = aws_vpc.main.id 
}

output "gateway_id" {
  value = aws_internet_gateway.gw.id
}


output "route_table_second_route" {
 #value = aws_route_table.second_rt.id
 value = aws_route_table.second_rt.route 
}

#https://stackoverflow.com/questions/63627282/outputs-from-for-each-loop-for-each-resource
#https://developer.hashicorp.com/terraform/language/expressions/splat

output "association_public_subnet_asso_loop" {
  #value = values(aws_subnet.public_subnets)[*].id
   #value = values(aws_route_table_association.public_subnet_asso)[*].id


  #value = [for id  in aws_subnet.public_subnets: id.arn] 
  value = {for k, v in aws_subnet.public_subnets: k => v.id}
  

}


/*

output "association_public_subnet_asso_0" {

 value =  aws_subnet.public_subnets[0]


}

output "association_public_subnet_asso_1" {

 value =  aws_subnet.public_subnets[1]


}

output "association_public_subnet_asso_2" {

 value =  aws_subnet.public_subnets[2]


}

*/




 
output "subnet_id_public" {
  value = aws_subnet.public_subnets[0].id
}

/*

output "environment" {
  value = aws_subnet.subbnet_azs_dev.id
  #dev = "${aws_subnet.subbnet_azs_dev.id}"
  #prod = "${aws_subnet.subnet_azs_test.id}"
}

*/

