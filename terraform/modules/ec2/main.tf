resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxxx"  # Amazon Linux 2 AMI
  instance_type = "t3.micro"
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  security_groups = [aws_security_group.ec2.id]

  user_data = <<-EOF
    #!/bin/bash
    yum update -y
    amazon-linux-extras enable nginx1
    yum install -y nginx docker
    systemctl start nginx
    systemctl start docker
    docker run -d -p 8080:8080 my-node-app
  EOF
}
