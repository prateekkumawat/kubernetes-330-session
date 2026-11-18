resource "aws_instance" "this1" {
  for_each = var.create_instance ? {for val in var.instance_details : val.instance_name => val } : {}
      
      ami           = each.value.ami
      instance_type  = each.value.instance_type
      key_name = each.value.key_name
      tags = {
        Name = each.value.instance_name
        env  = each.value.env
      }
}


resource "aws_db_instance" "this2" {
  
  for_each = { for k in var.rds_details : k.identifier => k }
    allocated_storage           = each.value.allocated_storage
    auto_minor_version_upgrade  = each.value.auto_minor_version_upgrade    
    backup_retention_period     = each.value.backup_retention_period 
    db_subnet_group_name        = each.value.db_subnet_group_name 
    engine                      = each.value.engine
    engine_version              = each.value.engine_version
    identifier                  = each.value.identifier
    instance_class              = each.value.instance_class
    multi_az                    = each.value.multi_az
    password                    = each.value.password
    username                    = each.value.username
   } 

