variable "repo_count" {
    type = number
    description = "Number of repositories"
    # variable is set in terraform.tfvars, like count = 4 for instance
    # it supersedes the default
    default = 1
}