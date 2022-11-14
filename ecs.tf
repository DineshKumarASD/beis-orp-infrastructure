module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "~> 3.5"

  name               = "ecs_webserver"
  container_insights = true
  capacity_providers = ["FARGATE"]
}


resource "aws_ecs_service" "webserver" {
  name            = "ecs_webserver"
  cluster         = module.ecs.ecs_cluster_id
  launch_type     = "FARGATE"
  task_definition = aws_ecs_task_definition.webserver.arn
  network_configuration {
    subnets = [
      aws_subnet.subneta.id,
      aws_subnet.subnetb.id,
      aws_subnet.subnetc.id,
    ]
    security_groups = [
      aws_security_group.ecs.id,
#      aws_security_group.cloudfront.id,
#      data.aws_security_group.s3_pl.id,
#      #      data.aws_security_group.ecr_sg.id,
#      #      data.aws_security_group.secrets_manager_sg.id
    ]
  }
  desired_count = local.ecs_config.ecs_service_count

  load_balancer {
    target_group_arn = module.alb.target_group_arns[0]
    container_name   = "beis-orp"
    container_port   = 3000
  }

  lifecycle {
    ignore_changes = [desired_count]
  }
  depends_on = [
#    module.alb.https_listeners,
    module.alb.http_tcp_listeners,
    aws_iam_role_policy.ecs_svc_policy
  ]
}

resource "aws_ecs_task_definition" "webserver" {
  family                   = "ecs_webserver"
  cpu                      = local.ecs_config.task_definition_cpu
  memory                   = local.ecs_config.task_definition_memory
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  execution_role_arn       = aws_iam_role.ecs_host.arn # "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/ecsTaskExecutionRole" #module.ec2_profile.iam_instance_profile_arn module.asg.iam_role_arn
  task_role_arn            = aws_iam_role.ecs_host.arn
  container_definitions = templatefile(
    "${path.module}/app.json",
    {
      docker_image_url     = "${data.aws_caller_identity.current.account_id}.dkr.ecr.${local.region}.amazonaws.com/beis"
      region               = local.region
#      data_bucket          = "westbury-music-data-${local.environment}"
#      rds_username         = "root"
#      rds_password         = data.aws_secretsmanager_secret_version.db_pass.secret_string #data.terraform_remote_state.db.outputs.aurora_postgresql_serverlessv2_cluster_master_password
#      rds_db_name          = "westbury"                                                   #data.terraform_remote_state.db.outputs.aurora_postgresql_serverlessv2_cluster_endpoint
#      rds_hostname         = data.terraform_remote_state.db.outputs.aurora_postgresql_serverlessv2_cluster_endpoint
      container_name       = "beis-orp"
      aws_log_group        = aws_cloudwatch_log_group.beis_orp.name
      stream_prefix        = "beis-orp"
      environment          = local.environment
#      distributions_bucket = data.aws_s3_bucket.distributions_bucket.bucket
    }
  )
}
