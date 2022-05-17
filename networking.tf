resource "aws_vpc" "main" {
    cidr_block = "172.28.0.0/16"
    enable_dns_hostnames = true

    tags = {
        Name = "main_vpc"
    }
}

resource "aws_subnet" "main" {
    for_each = {
        for subnet in var.subnets :
    subnet.name => subnet }

    vpc_id = aws_vpc.main.id
    cidr_block = each.value.cidr_block
    availability_zone = each.value.availability_zone

    tags = {
        Name = each.value.name
    }
    map_public_ip_on_launch = each.value.map_public_ip_on_launch
}


resource "aws_instance" "main" {
    for_each = {
        for instance in var.instances :
    instance.name => instance }

    ami = each.value.ami
    instance_type = each.value.instance_type
    #subnet_id = each.value.subnet_id
    subnet_id = each.value.type == "public" ? aws_subnet.main[0].id : aws_subnet.main[1].id
    vpc_security_group_ids = each.value.vpc_sec_grp_id

    tags = {
        Name = each.value.name
    }
}
