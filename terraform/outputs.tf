output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "reactjs_ecr_repository_url" {
  value = aws_ecr_repository.reactjs.repository_url
}

