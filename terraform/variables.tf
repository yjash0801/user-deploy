variable "project_name" {
    default = "mechanoidstore"
}

variable "environment" {
    default = "dev"
}

variable "common_tags" {
    default = {
        Name = "mechanoidstore"
        Environment = "dev"
        Terraform = "true"
    }
}

variable "tags" {
    default = {
        Component = "user"
    }
}

variable "dns" {
    default = "mechanoidstore.online"
}

variable "t3-micro" {
    default = "t3.micro"
}

variable "t2-micro" {
    default = "t2.micro"
}

variable "ec2_tags" {
    default = ""
}

variable "app_version" {
  
}

variable "iam_instance_profile" {
    default = "EC2RoleforShell"
}