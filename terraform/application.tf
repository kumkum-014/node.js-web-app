module "application-server" {

  source = "./application-server"

  ami-id = var.ami-id
  instance-type = var.instance-type

  iam-instance-profile = aws_iam_instance_profile.nodejs-web-app.id
  key-pair = aws_key_pair.nodejs-web-app-key.key_name

  subnet_id = aws_subnet.subnet-public-web-app.id

  name = "nodejs-web-app"

  repository-url = aws_ecr_repository.nodejs-web-app.repository_url
}
