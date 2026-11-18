output instnace_details {
    value = { 
        for k, v in aws_instance.this1 : k => {
            id    = v.id 
            public_ip = v.public_ip 
            private_ip = v.private_ip 
            Name = v.tags["Name"]
            env = v.tags["env"]
            region = v.region 
            availability_zone = v.availability_zone
        }
    }
}