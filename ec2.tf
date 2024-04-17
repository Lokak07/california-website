module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "explore-california"

  instance_type          = "t2.medium"
  ami = var.ami
  key_name               = "mypyapp"
  monitoring             = true
  vpc_security_group_ids = [module.web_server_sg.security_group_id]
  subnet_id = module.vpc.public_subnets[0]
  associate_public_ip_address = true



  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
user_data = <<-EOF
              #!/bin/bash

# Update package index and upgrade installed packages
sudo apt update && sudo apt upgrade -y

# Add Jenkins repository and import the repository key
sudo wget -q -O /tmp/jenkins_key https://pkg.jenkins.io/debian-stable/jenkins.io.key
sudo apt-key add /tmp/jenkins_key
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package index again to include the Jenkins repository
sudo apt update

# Install Java OpenJDK 11
sudo apt install openjdk-11-jdk -y

# Install Jenkins
sudo apt install jenkins -y

# Enable Jenkins to start on boot
sudo systemctl enable jenkins

# Start Jenkins service
sudo systemctl start jenkins

              EOF

}

