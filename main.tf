
resource "aws_ecr_repository" "worker" {
    name = "worker"
}

resource "aws_ecs_cluster" "ecs_cluster" {
    name="my-cluster"
}

data "template_file" "task_definition_template" {
    template = file("task_definition.json.tpl")
    vars = {
      "REPOSITORY_URL" = "142918928551.dkr.ecr.eu-west-1.amazonaws.com/worker"
    }
  
}

resource "aws_ecs_task_definition" "task_definition" {
    family = "worker"
    container_definitions = data.template_file.task_definition_template.rendered
}

resource "aws_ecs_service" "ecs1" {
  name            = "ecs1"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.task_definition.arn
  desired_count   = 3
}

