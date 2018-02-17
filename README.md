# ansibleassessment

## Objective:

Use CM tools such as Puppet, Ansible, or Chef to automate the installation of basic Drupal or WordPress. Setup a sample site. Automate the solution using Cloudformation template.

### Sub Objective: 
Learn and Understand Ansible functioning.
Compare it to running Environment using AWS Tools like Lambda

## Deliverable:

A cloudformation template that accepts user inputs as parameters where applicable ( for example, Admin password). This template should setup VPC, create subnets, launch a CM instance, pull the necessary code (modules, classes, recipes etc) from a GIT repo (or S3), and configure the web instance for basic Drupal or Wordpress setup.

## Steps:
1. Cloud Formation will instantiate an EC2 Instance with Jenkins Installed and Ansible Installed
-- Use the User Data section of the Cloud Formation Template to fetch an installer file from git hub and run it with sudo command
2. Configure the Jenkins to ensure that the Login works.
3. Create a Jenkins Job via the CLI

## References:
Special thanks to these references which helped me get here:

[1]: http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-apt-ubuntu
[2]: https://qbox.io/blog/deploying-elk-stack-ansible-elasticsearch-kibana-logstash
[3]: https://logz.io/blog/elk-stack-ansible/
[4]: https://github.com/sadsfae/ansible-elk
