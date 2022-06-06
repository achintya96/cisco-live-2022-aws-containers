#  Values of variables to override default values defined in variables.tf
#  Please changethe variable values, wherever you see XX to your user ID (assigned value from 01-16)


aws_site_name = "AWSSite" # the site name for the AWS site as seen on ND


schema_name = "CLUS_Schema_XX"  # XX is your user name 
template_name= "CLUS_TEMPLATE"            # use a template name as you wish
vrf_name      = "CLUS_VRF"                       # use a vrf name as you wish
bd_name       = "CLUS_BD"                        # use a bd name as you wish
anp_name      = "CLUS_ANP"                       # use a ANP name as you wish
region_name   = "us-east-1"                  



cidr_ip = "150.0.0.0/16" # CIDR IP as you wish for the VPC in AWS tenant account

subnet1 = "150.0.1.0/24" # subnet should belong to CIDR
zone1   = "us-east-1b"    

subnet2 = "150.0.2.0/24" # subnet should belong to CIDR
zone2   = "us-east-1b"    

subnet3 = "150.0.3.0/24" # subnet should belong to CIDR
zone3   = "us-east-1b"    



