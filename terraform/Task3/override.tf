#  use this override.tf to put in confidential data


#  Populate values based on your AWS values
variable "awsstuff" {
  type = object({
    aws_account_id    = string
    aws_access_key_id = string
    aws_secret_key    = string
  })
  default = {
    aws_account_id    = "637583011518"
    aws_access_key_id = "AKIAZI4XIV27FMS74GG6"
    aws_secret_key    = "Iv3vAWssSjgyU/h5TDFdGc9RlaRhe7rHY8KkWlV1"
  }
}



#  Populate values based on your ND cofigiration
variable "creds" {
  type = map(any)
  default = {
    username = "admin"
    password = "C1sco12345!"
    url      = "https://198.19.202.12/"
#    domain   = "put_in_auth_domain_defined_in_ND" # if you are using local user, comment this out.  
                                                  # Make sure to also comment out in variables.tf file.
  }
}
