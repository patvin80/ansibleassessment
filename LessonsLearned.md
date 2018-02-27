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
8. Checking the logs of the User Data execution found here in /var/log/cloud-init.log
9. Dependency on the .pem file and having it in a publilc repository is risky. Can be overcome by using the S3 location for the key?
10. Instace Profile was used to give the newly created instance capabilities to provision the EC2 instances and the docker container actually gets permissions from the host.

## Challenges or Blockages:
1. At this point I have the Linux AMI setup with Jenkins, however I need to override the password. One option I am considering is to do a Post on the Admin URL by reading the file at sudo vi /var/lib/jenkins/secrets/initialAdminPassword.
2. User does not have capabilities to create AMIs which means that I cannot set up the jobs using the screen and then back up the AMI and use that for CloudFormation. - Question to Mike if this can be changed. No need to change.
3. More trouble as the newly created VPC is not a DefaultVPC I need to figure out a way to set this to some value so that the EC2 instance Ansible tutorial will work. - Ending up creating a VPC and then passing the VPC everywhere an EC2 Instance was provisioned.
4. Path variable on the Jenkins server is not able to recognize ansible-playbook. Tried [5], but looks like the path is set correctly but may be Jenkins does not have the permissions to invoke ansible-playbook. Solved using export HOME=/home/`whoami`
5. Looks like the <s>keys</s> and PEM file need to be in the source control for this solution to work. - Eliminated the need for that by using Instance Profile and ec2_key ansible construct which also generates a key and a private key file.
6. Instance Profile is a great option to avoid the Keys being passed around. However still the PEM file needs to be addressed.
7. Server size does not support Elasticsearch and Kibana and Logstash to run on the same machine. Might consider moving Elasticsearch to external server or as a service. - Pending
8. Elasticsearch with wrong configuration, results in Kibana not being able to reach Elasticsearch.

## Ansible
1. Install Ansible Instructions on Ubuntu [1]
2. Install Ansible Instructions on Linux AMI [3]
3. Passing variables to Ansible Commands [4]
4. Using the template here [8]. Fixed the yml files which looked like JSON using the tool here [9]. Modified the templates to upgrade versions and simplify using [12] 
    1. Elastic Search version had to be upgraded.
    2. Elastic Search configuration had to be change in the main.yml
    3. All references to the vars/main.yml removed in Elasticsearch installation
    4. Kibana installation had to be simplified and any dependencies on the init file and vars folder removed. Now simplified it to just main.yml file based installation.
    5. Logstash commented certain failing command.

## Jenkins
1. Jenkins CLI Setup [5]
2. Jenkins CLI Authentication [5]
3. Install Ansible Plugin for Jenkins [6]
4. Setting up Path Variables in Jenkins [7]
5. Getting the value of the Jenkins API Key [10]

## ELK Stack
1. Kibana Configuration File is kibana.yml - /etc/kibana/kibana.yml
2. Elasticsearch Configuration File is elacticsearch.yml - /etc/elasticsearch/elasticsearch.yml
3. Kibana Instructions for apt-get involve updating the apt repository [11]
4. Elasticsearch Log file sudo vi /var/log/elasticsearch/elasticsearch.log
5. Memory Constraints of Elasticsearch very rigorous. /etc/elasticsearch/jvm.options setting the Xms and Xmx configuration values.

## General
1. ssh ignores pem file if the security is 644 needs to tighten it to 400

## References:

[1]: https://gist.github.com/afternoon/3837048
[2]: https://www.codeengine.com/articles/install-jenkins-on-amazon-linux/
[3]: https://cloudacademy.com/blog/get-started-with-ansible-on-the-cloud/
[4]: https://stackoverflow.com/questions/30662069/how-can-i-pass-variable-to-ansible-playbook-in-the-command-line
[5]: https://isignal.github.io/notes/jenkins-cli.html
[6]: https://wiki.jenkins.io/display/JENKINS/Ansible+Plugin
[7]: https://stackoverflow.com/questions/36473479/how-to-set-the-path-environment-variable-in-jenkins-configuration-on-windows/36502958
[8]: https://github.com/inonit/ansible-elk
[9]: https://www.json2yaml.com/
[10]: https://stackoverflow.com/questions/11523809/how-can-i-extract-a-tags-attribute-value-from-an-html-file
[11]: https://www.elastic.co/guide/en/kibana/current/deb.html
[12]: https://github.com/sadsfae/ansible-elk