variable "gitlab_token" {
    description = "GitLab token for authentication"
    type        = string
    sensitive   = true
    default     = null
}
