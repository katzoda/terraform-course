resource "github_repository" "kd-repo" {
  name        = "kd-repo"
  description = "terraform repo"
  visibility  = "private"
  auto_init   = true
}

resource "github_repository_file" "readme" {
  # it is setting an implicit tenancy - this github_repository needs to be created first
  # because I have specified the implicit reference or "dependency link" to the repository and didn't hardcoded the name "kd-repo" >> terraform will know that it needs to create this repo first
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