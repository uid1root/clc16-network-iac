variable "env" {
    type = string
    default = "prd"
}

variable "vpc_name" {
    type = string
    default = "vinicius-tf"
}

variable "pub_subnet_1a_name" {
    type = string
    default = "terraform-public-subnet-1a"
}

variable "pub_subnet_1c_name" {
    type = string
    default = "terraform-public-subnet-1c"
}

variable "priv_subnet_1a_name" {
    type = string
    default = "terraform-private-subnet-1a"
}

variable "priv_subnet_1c_name" {
    type = string
    default = "terraform-private-subnet-1c"
}

## Exemplos de variaveis ##
# variable "environment" {
#   type    = string
#   default = "dev"
# }

# variable "az_count" {
#   type    = number
#   default = 2
# }

# variable "enable_nat" {
#   type    = bool
#   default = true
# }

# variable "azs" {
#   type    = list(string)
#   default = ["us-east-1a", "us-east-1b"]
# }

# variable "instance_types" {
#   type = map(string)
#   default = {
#     dev  = "t3.micro"
#     prod = "t3.small"
#   }
# }

# variable "app" {
#   type = object({
#     name = string
#     port = number
#   })
#   default = {
#     name = "web"
#     port = 80
#   }
# }
