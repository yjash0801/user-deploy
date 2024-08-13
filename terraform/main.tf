module "user" {
    source = "git::https://github.com/yjash0801/mechanoidstore-app-terraform.git?ref=master"
    vpc_id = data.aws_ssm_parameter.vpc_id.value
    component_sg_id = data.aws_ssm_parameter.user_sg_id.value
    private_subnet_ids = split(",", data.aws_ssm_parameter.private_subnet_ids.value)
    iam_instance_profile = var.iam_instance_profile
    priority = 30
    project_name = var.project_name
    environment = var.environment
    common_tags = var.common_tags
    tags = var.tags
    dns = var.dns
    listener_arn = data.aws_ssm_parameter.listener_arn.value
    app_version = var.app_version
}