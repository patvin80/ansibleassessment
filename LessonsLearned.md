# Lessons Learned and Resources

## Cloud Formation
1. EC2 Instance creation template requires VPC Configuration to be outlined in order to ensure that the instance can be provisioned. 
Error was related to default VPC is not configured for the user.
2. Network interfaces and an instance-level security groups may not be specified on the same request. Fixed the issue with the Template to not include Security Group. 
3. Created a PEM file using the console. Could have automated it.
4. Jenkins server provided by Bitnami needs to accept terms and the user does not have permissions. Trying the private AMI in the account - ami-13a8a769 -- Does not work
5. Jenkins Server from scratch based upon Ubuntu Image - [1] ami-5a19976a -- Did not work
6. Community AMI Jenkins ami-5cb48d4b - Did not work
7. Created an Linux AMI and followed instructions here [2]

## Challenges or Blockages:
1. At this point I have the Linux AMI setup with Jenkins, however I need to override the password. One option I am considering is to do a Post on the Admin URL by reading the file at sudo vi /var/lib/jenkins/secrets/initialAdminPassword.
2. User does not have capabilities to create AMIs which means that I cannot set up the jobs using the screen and then back up the AMI and use that for CloudFormation. - Question to Mike if this can be changed.
3. More trouble as the newly created VPC is not a DefaultVPC I need to figure out a way to set this to some value so that the EC2 instance Ansible tutorial will work.

## Ansible
1. Install Ansible Instructions on Ubuntu [1]
2. Install Ansible Instructions on Linux AMI [3]
3. Passing variables to Ansible Commands [4]

## Jenkins
1. Jenkins CLI Setup [5]
2. Jenkins CLI Authentication [5]
3. Install Ansible Plugin for Jenkins [6]
4. Setting up Path Variables in Jenkins [7]

## General
1. ssh ignores pem file if the security is 644 needs to tighten it to 400

[1]: https://gist.github.com/afternoon/3837048
[2]: https://www.codeengine.com/articles/install-jenkins-on-amazon-linux/
[3]: https://cloudacademy.com/blog/get-started-with-ansible-on-the-cloud/
[4]: https://stackoverflow.com/questions/30662069/how-can-i-pass-variable-to-ansible-playbook-in-the-command-line
[5]: https://isignal.github.io/notes/jenkins-cli.html
[6]: https://wiki.jenkins.io/display/JENKINS/Ansible+Plugin
[7]: https://stackoverflow.com/questions/36473479/how-to-set-the-path-environment-variable-in-jenkins-configuration-on-windows/36502958