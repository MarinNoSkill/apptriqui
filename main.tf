provider "aws" {
  region = "us-east-1"  # Cambia a tu región AWS deseada
}

resource "aws_key_pair" "deployer_key" {
  key_name   = "triqui"
  public_key = file("triqui.pub")
}

# Security Group para la instancia EC2 en la subnet privada
resource "aws_security_group" "triqui_sg" {
  name        = "triqui-security-group"
  description = "Security group para la instancia Triqui"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Instancia EC2 en la subnet privada
resource "aws_instance" "triqui_instance" {
  ami           = "ami-0e001c9271cf7f3b9"  # Ubuntu 22.04 AMI, cambia según tu región y AMI
  instance_type = "t2.large"
  key_name      = "triqui"  # Cambia al nombre de tu llave pública en AWS
  security_groups = [aws_security_group.triqui_sg.name]
  associate_public_ip_address = true
    tags = {
    Name = "triqui"
  }
  user_data     = <<-EOF
    #!/bin/bash
    sudo apt update
    sudo apt install ufw -y
    sudo ufw allow 3000/tcp
    sudo ufw enable
    sudo apt install docker-compose -y
    git clone https://github.com/trekab/tic-tac-toe-app.git
    cd tic-tac-toe-app/
    sudo docker build -t triqui:v01 .
    sudo docker run -d -p 3000:3000 triqui:v01 npm start
  EOF
  
}
