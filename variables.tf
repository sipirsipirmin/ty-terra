variable "project" {
  default = "warm-skill-318315"
}

variable "cluster_name" {}

variable "region" {
  default = "us-central1"
}

variable "zone" {
  default = "us-central1-a"
}

variable "network" {}
variable "k8s_range" {}
variable "pod_range" {}
variable "service_range" {}
variable "master_ipv4_cidr_block" {}
variable "subnet_name" {}
variable "ci_subnet" {}
variable "ci_subnet_name" {}