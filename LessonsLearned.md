# Lessons Learned and Resources

## Cloud Formation
1. EC2 Instance creation template requires VPC Configuration to be outlined in order to ensure that the instance can be provisioned. 
Error was related to default VPC is not configured for the user.
2. Network interfaces and an instance-level security groups may not be specified on the same request. Fixed the issue with the Template to not include Security Group. 
3. Created a PEM file using the console. Could have automated it.
4. Jenkins server provided by Bitnami needs to accept terms and the user does not have permissions. Trying the private AMI in the account - ami-13a8a769 -- Does not work
5. Jenkins Server from scratch based upon Ubuntu Image - [1] ami-5a19976a

## Ansible
1. Install Ansible Instructions on Ubuntu [1]

## General
1. ssh ignores pem file if the security is 644 needs to tighten it to 400

[1]: https://gist.github.com/afternoon/3837048