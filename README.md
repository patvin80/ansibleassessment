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

## Implementation Details:
1. JenkinsServerFromScratch.json is the Cloud Formation Template
    1.0. Accepts a Key Pair file used as Parameter to provision the instance.
    1.1. The template provisions an EC2 Instance in a VPC with a Subnet and a Security Group ranging from 22 for SSH and 80 to 9500. 
    1.2. The Template also associates a Role which has EC2 permissions to provision additional EC2 Resources and associates it to the EC2 Instance. This avoids passing credentials.
    1.3. User Data is configured to:
        1.3.1. Install Git, Docker
        1.3.2. Pull the ansibleassessment git repository which has all the code to install and provision.
        1.3.3. Install Docker-Compose
        1.3.4. Run Docker-Compose Build and UP to provision a Jenkins Server. Also copy the ansible scripts to the server. 
        1.3.5. Connect to the Jenkins Server via Rest CLI and user name and password to get API Key
        1.3.6. Use the config.xml file which is the Jenkins Job definition file
        1.3.7. Use curl on the Jenkins URL to upload the job.
        1.3.8. Use curl on the Jenkins URL to run the job
    1.4. The Jenkins Job will provision the Ansible ELK Stack Environment.


2. Ansible ELK Playbook:
    2.1. Ansbile ELK Playbook consists of hosts file and ec2.yml file with the roles folder.
    2.2. Ansible Hosts File has localhost and ec2hosts section.
    2.3. Ansbile ec2.yml file has 3 tag sections:
    2.3.1. setup - Sets up the EC2 Instance | ansible-playbook -i hosts --tags "setup" ec2.yml
    2.3.2. vinkar - Installs Python2 on the instance | ansible-playbook -i hosts --tags "vinkar" ec2.yml
    2.3.3. provision - Provisions the 5 roles | ansible-playbook -i hosts --tags "provision" ec2.yml
        2.3.3.1. common - Java
        2.3.3.2. Elasticsearch - roles/elasticsearch/tasks/main.yml
        2.3.3.3. Kibana - roles/kibana/tasks/main.yml
        2.3.3.4. Logstash - roles/kibana/tasks/main.yml | roles/kibana/tasks/logstash.yml | roles/kibana/tasks/logstash-forwarder.yml
        2.3.3.5. Nginx - roles/nginx/tasks/main.yml

## Pending:
1. The Installation of Python2 does not work from the Jenkins. Have to remote to the machine and then docker container using the command:
docker exec -it "example_jenkins_1 bash
Run the command with tags vinkar
2. The Installation of ELK stack also done using the command line.
3. ElasticSearch Installation crashes the machine as too high memory requirements.


## References:
Special thanks to these references and many more in LessonsLearnedwhich helped me get here:

[1]: http://docs.ansible.com/ansible/latest/intro_installation.html#latest-releases-via-apt-ubuntu
[2]: https://qbox.io/blog/deploying-elk-stack-ansible-elasticsearch-kibana-logstash
[3]: https://logz.io/blog/elk-stack-ansible/
[4]: https://github.com/sadsfae/ansible-elk
[5]: https://github.com/inonit/ansible-elk
