resource "aws_instance" "default" {

  ami           = var.ami-id
  instance_type = "t3.micro"
  subnet_id = var.subnet_id
  key_name      = var.key-pair

  user_data = templatefile("${path.module}/user_data.sh", {
    repository_url = var.repository-url
  })

  tags = {
    Name = var.name
  }
}
