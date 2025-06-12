variable "aws_region" {
  description = "Região AWS onde os recursos serão criados"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "Tipo de instância EC2"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID para a instância (Amazon Linux 2)"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}
