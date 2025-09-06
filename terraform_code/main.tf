resource "random_id" "random" {
  byte_length = 2
}

resource "github_repository" "kd-repo" {
  name        = "kd-repo-${random_id.random.dec}"
  description = "terraform repo"
  visibility  = "private"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  # by specifying repository attribute as "github_repository.kd-repo.name", it is setting an implicit tenancy or "dependency link"
  # terraform will then know that it needs to create this repo first
  repository = github_repository.kd-repo.name
  branch = "main"
  file = "README.md"
  content = "# This is a repo for infra developers"
  overwrite_on_create = true
}

resource "github_repository_file" "index" {
  repository = github_repository.kd-repo.name
  branch = "main"
  file = "index.html"
  content = "<h1>Hello Terraform!</h1>"
  overwrite_on_create = true
}