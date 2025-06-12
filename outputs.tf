output "instance_public_ip" {
  description = "Endereço IP público da instância EC2"
  value       = aws_instance.demo_ec2.public_ip
}
