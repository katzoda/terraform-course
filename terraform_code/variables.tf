variable "repo_count" {
  type        = number
  description = "Number of repositories"
  # variable is set in terraform.tfvars, like count = 4 for instance
  # it supersedes the default
  default = 1

  validation {
    condition     = var.repo_count < 5
    error_message = "Do not deploy more than 5 repositories!"
  }
}

variable "varsource" {
  type        = string
  description = "Source used to define variables"
  default     = "variables.tf"
}

# Specify the environment to which we doploying our code
variable "env" {
  type        = string
  description = "Deployment environment"
  validation {
    #condition = var.env == "dev" || var.env == "prod"
    condition     = contains(["dev", "prod"], var.env)
    error_message = "Env must be 'dev' or 'prod'"
  }
}