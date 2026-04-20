/*
 module "jenkins" {
  source = "./jenkins-server"

  ami-id = var.ami-id
  instance-type = var.instance-type

  iam-instance-profile = aws_iam_instance_profile.jenkins.id
  key-pair = aws_key_pair.jenkins-key.key_name

  subnet_id = aws_subnet.subnet-public-jenkins.id

  name = "jenkins"

  admin-username = var.admin-username
  admin-password = var.admin-password
  admin-fullname = var.admin-fullname
  admin-email = var.admin-email

  remote-repo = var.remote-repo

  job-name = var.job-name
}
*/ 
