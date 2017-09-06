# pipeline_as_a_code
#========================================
# | |_ ___ _ _ _ _ __ _ / _|___ _ _ _ __
# |  _/ -_) '_| '_/ _` |  _/ _ \ '_| '  \
#  \__\___|_| |_| \__,_|_| \___/_| |_|_|_|
#
# Author:shegoj 
# Company: AGS-Tech Training
# Date: 02/09/2017
# Name: FIRST DRAFT OF INFRA BUILD
#========================================
#
# SUMMARY:
# --------
To run go to terraform directory and exec the following

terraform init
export TF_VAR_ec2_key=your_ec2_key  ##create in eu-west-1 region. make sure it exists and you have acces to it
export AWS_SECRET_ACCESS_KEY=<key>
export AWS_ACCESS_KEY_ID=<id>

terraform apply

#you should have an output similar to below:
Apply complete! Resources: 8 added, 0 changed, 0 destroyed.

Outputs:

public_IPs = 34.253.186.67
vpc = vpc-54076a33


####

wait a couple of minutes then try http://34.253.186.67:8080
user=tech-user
passd= tech-pass
