# ## Busca a AMI mais recente do Amazon Linux 2023 (x86_64) ##
# data "aws_ami" "amazon_linux_2023" {
#   most_recent = true
#   owners      = ["amazon"]

#   filter {
#     name   = "name"
#     values = ["al2023-ami-2023.*-x86_64"]
#   }

#   filter {
#     name   = "virtualization-type"
#     values = ["hvm"]
#   }
# }

# ## Security Group liberando HTTP de entrada e toda a saida ##
# resource "aws_security_group" "sg_web" {
#   name        = "sg_web_tf"
#   description = "Libera HTTP de entrada e toda a saida"
#   vpc_id      = aws_vpc.clc_vpc.id

#   ingress {
#     description = "HTTP"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   egress {
#     description = "Toda a saida"
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "sg_web_tf"
#   }
# }

# ## Cria a EC2 na subnet publica 1a, com IP publico e Apache via user_data ##
# resource "aws_instance" "ec2_web" {
#   ami                         = data.aws_ami.amazon_linux_2023.id
#   instance_type               = "t3.micro"
#   subnet_id                   = aws_subnet.public_subnet_1a.id
#   vpc_security_group_ids      = [aws_security_group.sg_web.id]
#   associate_public_ip_address = true

#   # Recria a instancia se o user_data mudar (ele so roda no primeiro boot)
#   user_data_replace_on_change = true

#   user_data = <<-EOF
#     #!/bin/bash
#     dnf install -y httpd
#     systemctl enable --now httpd
#     cat > /var/www/html/index.html <<'HTML'
#     <!DOCTYPE html>
#     <html lang="pt-BR">
#     <head><meta charset="utf-8"><title>CLC 16</title></head>
#     <body><h1>CHEGUEI ATÉ AQUI - Vinicius Cavalcanti - CLC 16</h1></body>
#     </html>
#     HTML
#   EOF

#   tags = {
#     Name = "ec2_web_tf"
#   }
# }

# ## ---------- EC2 ---------- ##

# output "security_group_id" {
#   description = "ID do Security Group da EC2"
#   value       = aws_security_group.sg_web.id
# }

# output "ec2_instance_id" {
#   description = "ID da instancia EC2"
#   value       = aws_instance.ec2_web.id
# }

# output "ec2_public_ip" {
#   description = "IP publico da instancia EC2"
#   value       = aws_instance.ec2_web.public_ip
# }

# output "site_url" {
#   description = "URL da pagina servida pelo Apache"
#   value       = "http://${aws_instance.ec2_web.public_ip}"
# }
