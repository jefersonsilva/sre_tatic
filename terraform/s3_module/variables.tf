variable "bucket_name" {
    description = "Name of the bucket"
    type =  string
    default = "calc"
  
}

variable "tag_name" {
    description = "Dafault tag Name"
    type =  string
    default = "calculadora"
  
}


variable "tag_env" {
    description = "Default Environment"
    type =  string
    default = "Production"
  
}


variable "deafault_route_53_zone" {
    description = "deafault zone id"
    type =  string
    default = "Z04130716X3SCR9L4MV9"
  
}


variable "deafault_domain" {
    description = "main domain"
    type =  string
    default = "jefersonsilva.in"
  
}


variable "deafault_profile" {
    description = "Default profile aws account"
    type =  string
    default = "jef"
  
}

variable "deafault_region" {
    description = "default region"
    type =  string
    default = "us-east-1"
  
}

