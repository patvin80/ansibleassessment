# Install Jenkins 
sudo yum -y update
sudo yum install -y git nginx java-1.8.0-openjdk-devel aws-cli
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install -y jenkins
sudo service jenkins start
sudo chkconfig --add jenkins

# At this point I have the Linux AMI setup with Jenkins, however I need to override the password.
# One option I am considering is to do a Post on the Admin URL by reading the file at sudo vi /var/lib/jenkins/secrets/initialAdminPassword
# Status Pending

# Install Ansible
sudo pip install ansible

sudo pip install boto
