variable "subnets" {
    default = [
        {
            name = "subnet1"
            cidr_block = "172.28.8.0/24"
            availability_zone = ["eu-west-2a", "eu-west-2c", "eu-west-2c"]
        },
        {
            name = "subnet2"
            cidr_block = "172.28.16.0/24"
            availability_zone = ["eu-west-2a", "eu-west-2c"]
        }        
    ]
}

variable "instances" {
    default = [
        {
            ami = "1111111111"
            instance_type = "t2.micro"
            subnet_id = "458752452"
            type = "public"
            vpc_sec_grp_id = "22222"
            name = "linux_instance"
        },
        {
            ami = "0000000000"
            instance_type = "t2.mini"
            subnet_id = "987654321"
            type = "private"
            vpc_sec_grp_id = "33333"
            name = "windows_instance"
        }        
    ] 
}


