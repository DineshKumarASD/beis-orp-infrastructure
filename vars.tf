variable "route53_zone_dev" {
  type = string
}

variable "route53_domain" {
  type = string
}

variable "package_url" {
  type = string
}

variable "tf_profile" {
  type = string
}

variable "environment" {
  type = string
}

variable "ddb_user" {
  type = string
}

variable "ddb_user" {
  type = string
}

variable "ddb_user" {
  type = string
}

variable "pdf_to_text_image_ver" {
  type = string
}

variable "typedb_search_query_image_ver" {
  type = string
}

variable "keyword_extraction_image_ver" {
  type = string
}

variable "typedb_ingestion_image_ver" {
  type = string
}

variable "destination_sqs_url" {
  type = string
}

variable "database_workdir" {
  type = string
}

variable "typedb_database_name" {
  type = string
}

variable "typedb_database_schema" {
  type = string
}

variable "typedb_database_file" {
  type = string
}

variable "typedb_docu_sqs_name" {
  type = string
}

variable "typedb_server_port" {
  type = number
}

variable "domain" {
  type = string
}

variable "s3_upload_bucket" {
  type = string
}

variable "s3_data_lake" {
  type = string
}

variable "s3_model_bucket" {
  type = string
}

variable "mc_server" {
  type = string
}

variable "mc_list" {
  type = string
}

variable "orp_search_url" {
  type = string
}

variable "engine_version" {
  type = string
}

variable "engine" {
  type = string
}

variable "scaling_min_capacity" {
  type = string
}

variable "scaling_max_capacity" {
  type = string
}

variable "monitoring_interval" {
  type = string
}

variable "enable_http_endpoint" {
  type = bool
}

variable "deletion_protection" {
  type = bool
}

variable "AmazonEC2ContainerServiceforEC2Role" {
  type = string
}

variable "AmazonSSMManagedInstanceCore" {
  type = string
}

variable "CloudWatchLogsFullAccess" {
  type = string
}

variable "AmazonECS_FullAccess" {
  type = string
}

variable "NeptuneAccess" {
  type = string
}

variable "ecs_service_count" {
  type = string
}

variable "db_address" {
  type = string
}

variable "route_53_public_zone" {
  type = string
}

variable "enable_monitoring" {
  type = bool
}

variable "delete_on_termination" {
  type = bool
}

variable "encrypted_volume" {
  type = bool
}

variable "volume_size" {
  type = string
}

variable "template_file" {
  type = string
}

variable "task_definition_cpu" {
  type = string
}

variable "task_definition_memory" {
  type = string
}

variable "autoscale_max_capacity" {
  type = number
}

variable "metric_name" {
  type = string
}

variable "datapoints_to_alarm" {
  type = number
}

variable "evaluation_periods" {
  type = number
}

variable "period" {
  type = number
}

variable "cooldown" {
  type = number
}

variable "adjustment_type" {
  type = string
}

variable "scale_up_threshold" {
  type = number
}

variable "scale_down_threshold" {
  type = number
}

variable "scale_up_comparison_operator" {
  type = string
}

variable "scale_up_interval_lower_bound" {
  type = number
}

variable "scale_up_adjustment" {
  type = number
}

variable "scale_down_comparison_operator" {
  type = string
}

variable "scale_down_interval_lower_bound" {
  type = number
}

variable "scale_down_adjustment" {
  type = number
}
