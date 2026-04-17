resource "aws_instance" "default" {

  ami           = "ami-0f5ee92e2d63afc18"
  instance_type = "t2.micro"

  key_name = "jenkins"

  vpc_security_group_ids = [aws_security_group.allow-web-traffic.id]

  subnet_id = aws_subnet.subnet-public-web-app.id

  associate_public_ip_address = true

  tags = {
    Name = "jenkins-server"
  }

}
