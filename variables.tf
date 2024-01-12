variable "region" {
  type        = string
  default     = "asia-southeast1"
  description = "Google Cloud region"
}

variable "project_services" {
  type        = list(string)
  default     = []
  description = "google project enabled apis"
}

variable "project_id" {
  type        = string
  default     = ""
  description = "The current GCP project id"
}