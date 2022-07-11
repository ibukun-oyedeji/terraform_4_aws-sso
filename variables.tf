variable "region" {
    description = "AWS region to create resources in"
    type        = string
    default     = "us-east-1"
}

variable "permission list" {
    type                = list(object({
    name                = string
    description         = string
    session_duration    = string
    managed_policies    = list(string)
    aws_accounts        = list(string)
    sso_groups          = list(string)
    }))
    description = "list of permission set properties"
}