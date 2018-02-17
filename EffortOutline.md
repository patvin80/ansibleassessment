# Efforts Outline

## Infrastructure Assets:
1. Jenkins Installed Server - EC2 Instance using the AMI from Bitnami - AMI ID: <s>ami-3e241844</s> <s>ami-13a8a769</s> 
2. Sample EC2 Instance created using Ansible to understand infra provisioning using Ansible
3. ELK Server provisioned at 10.0.0.25
4. AMI Created with Jenkins and Ansible configured - vvp-ansible-jenkins

## Software Assets:
1. Cloud Formation Template - Jenkins Creation
2. SH file to back and create an AMI
3. Ansible Installation Script 
4. Ansible Playbook - EC2 Instance provisioning [5][6]
5. Ansible Playbook - ELK Stack Provisioning [2], [3]
6. Cloud Formation Template to provision based upon vvp-ansible-jenkins

## Steps:
1. Create Jenkins Instance using the Cloud Formation Template - 02/16/2018 - In Progress
2. Create a script to install Ansible on the Server [1] - 02/17/2018
3. Incorporate the script in User Data in Cloud Formation Template - 02/17/2018 
4. Create an Ansible Play book to provision an EC2 Server with Apache - 02/17/2018
5. Create a Jenkins Job to execute the EC2 Provisioning - 02/17/2018
5. Sub Deliverable complete
6. Review the script here [2][3] - 02/19/2018
7. Set it up on the Jenkins Server - 02/20/2018
8. Validate the script - 02/21/2018
9. Package the Jenkins Server as an AMI - 02/22/2018

### References: 
[1]: http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-apt-ubuntu
[2]: https://qbox.io/blog/deploying-elk-stack-ansible-elasticsearch-kibana-logstash
[3]: https://logz.io/blog/elk-stack-ansible/
[4]: https://github.com/sadsfae/ansible-elk
[5]: https://www.agix.com.au/build-an-ec2-using-ansible-step-by-step/
[6]: https://blog.scottlowe.org/2016/10/23/managing-aws-infrastructure-ansible/