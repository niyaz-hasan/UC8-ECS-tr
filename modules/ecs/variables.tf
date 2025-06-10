variable "name" {
  description = "Name of the application"
  type        = string
}

variable "ecr_repo_url" {
  description = "URL of the ECR repository"
  type        = string
}

#variable "availability_zones" {
#  description = "List of availability zones"
#  type        = list(string)
#}

variable "subnets" {
  description = "subnets"
  type        = list(string)
}

variable "security_group_id" {
  description = "security_group_id"
  type        = list(string)
}