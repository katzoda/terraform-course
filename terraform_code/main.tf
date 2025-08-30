resource "github_repository" "kd-repo" {
  name        = "kd-repo"
  description = "terraform repo"
  visibility  = "private"
  auto_init   = true
}