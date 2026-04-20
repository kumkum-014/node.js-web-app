variable "ami-id" { type = string }

variable "iam-instance-profile" { type = string }

variable "instance-type" { type = string }

variable "key-pair" { type = string }

variable "device-index" { type = string }

variable "network-interface-id" { type = string }

variable "repository-url" { type = string }

variable "repository-test-url" { type = string }

variable "repository-staging-url" { type = string }

variable "instance-id" { type = string }

variable "bucket-logs-name" { type = string }

variable "bucket-config-name" { type = string }

variable "public-dns" { type = string }

variable "admin-username" { type = string }

variable "admin-password" { type = string }

variable "admin-fullname" { type = string }

variable "admin-email" { type = string }

variable "remote-repo" { type = string }

variable "job-name" { type = string }

variable "job-id" { type = string }

variable "name" { type = string }

variable "aws-access-key" { type = string }

variable "aws-secret-key" { type = string }

variable "secrets" { type = map(string) }

variable "aws-region" { type = string }
