variable "ami-id" {}
variable "iam-instance-profile" {}
variable "instance-type" {}
variable "key-pair" {}

variable "repository-url" {}
variable "repository-test-url" {}
variable "repository-staging-url" {}

variable "instance-id" {}
variable "bucket-logs-name" {}

variable "public-dns" {}

variable "admin-username" {}
variable "admin-password" {}
variable "admin-fullname" {}
variable "admin-email" {}

variable "remote-repo" {}

variable "job-name" {}
variable "job-id" {}

variable "bucket-config-name" {}

variable "name" {}

variable "subnet_id" {
 type = string
}
