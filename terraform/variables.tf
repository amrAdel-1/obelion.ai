variable "region" {
  description = "The region to use for the AWS provider"
  type        = string
  default     = "eu-north-1"
}

variable "alert_email" {
  description = "Email for alerts"
  type        = string
  default     = "amr.adel512001@gmail.com"
}
