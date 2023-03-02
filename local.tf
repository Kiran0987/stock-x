locals {
  app_fullname="stockx-poc"
  container = {
    name = "${local.app_name}"
    http_port = 80
  }
  fargate_execution_role_name = "${local.app_fullname}-fargate-execution-role"
  fargate_execution_role_policy_name = "${local.fargate_execution_role_name}-policy"
  fargate_task_role_name = "${local.app_fullname}-fargate-task-role"
  fargate_task_role_policy_name = "${local.fargate_task_role_name}-policy"
  ecr_publisher_name = "ecr-publisher"
  ecr_publisher_policy_name = "${local.ecr_publisher_name}-policy"
}
