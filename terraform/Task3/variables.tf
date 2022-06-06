#  Default values can be defined here, which can be overwritten by values defined in terraform.tfvars
#  You will also create a overwrite.tf file where you can keep confidential values

variable "creds" {
  type = map(any)
  default = {
    username = "someuser"
    password = "something"
    url      = "someurl"

  }
}



variable "tenant_stuff" {
  type = object({
    tenant_name  = string
    display_name = string
    description  = string
  })
  default = {
    tenant_name  = "CLUS_TENANT_XX" # change XX to your assigned user name 
    display_name = "CLUS_TENANT_XX" # change XX to your assigned user name 
    description  = " Terraform Created Tenant for user XX" # change XX to your assigned user name 
  }
}


variable "schema_name" {
  type    = string
  default = "some_value"
}

variable "template_name" {
  type    = string
  default = "some_value"
}

variable "template_name_1" {
  type    = string
  default = "some_value"
}

variable "aws_site_name" {
  type    = string
  default = "site_name_as_seen_on_NDO"
}

variable "vrf_name" {
  type    = string
  default = "some_value"
}

variable "bd_name" {
  type    = string
  default = "some_value"
}

variable "anp_name" {
  type    = string
  default = "some_value"
}

variable "epg_name" {
  type    = string
  default = "some_value"
}

variable "epg_selector_value" {
  type    = string
  default = "some_value"
}

variable "region_name" {
  type    = string
  default = "some_value"
}

variable "cidr_ip" {
  type    = string
  default = "some_value"
}

variable "subnet1" {
  type    = string
  default = "some_value"
}


variable "subnet2" {
  type    = string
  default = "some_value"
}

variable "subnet3" {
  type    = string
  default = "some_value"
}

variable "zone1" {
  type    = string
  default = "some_value"
}

variable "zone2" {
  type    = string
  default = "some_value"
}

variable "zone3" {
  type    = string
  default = "some_value"
}

variable "tgw_name" {
  type = string
  default = "your_tgw_name"
}

variable "awsstuff" {
  type = object({
    aws_account_id    = string
    aws_access_key_id = string
    aws_secret_key    = string
  })
  default = {
    aws_account_id    = "000000000000"
    aws_access_key_id = "00000000000000000000"
    aws_secret_key    = "0000000000000000000000000000000000000000"
  }
}

