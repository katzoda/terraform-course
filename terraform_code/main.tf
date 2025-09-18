resource "random_id" "random" {
  byte_length = 2
  count       = var.repo_count
}

resource "github_repository" "kd-repo" {
  count       = var.repo_count
  name        = "kd-repo-${random_id.random[count.index].dec}"
  description = "terraform repo"
  visibility  = "private"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  # by specifying repository attribute as "github_repository.kd-repo.name", it is setting an implicit tenancy or "dependency link"
  # terraform will then know that it needs to create this repo first
  count               = var.repo_count
  repository          = github_repository.kd-repo[count.index].name
  branch              = "main"
  file                = "README.md"
  content             = "# This is a repo for infra developers"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  count               = var.repo_count
  repository          = github_repository.kd-repo[count.index].name
  branch              = "main"
  file                = "index.html"
  content             = "<h1>Hello Terraform!</h1>"
  overwrite_on_create = true
}

output "clone_urls" {
  value       = { for i in github_repository.kd-repo[*] : i.name => i.http_clone_url }
  description = "repository names and URLs"
  sensitive   = false
}

output "varsource" {
  value = var.varsource
  description = "Source being used to source variable definition"
}