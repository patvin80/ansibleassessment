# Install Jenkins 
sudo yum -y update
sudo yum install -y git nginx java-1.8.0-openjdk-devel aws-cli
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install -y jenkins
sudo service jenkins start
sudo chkconfig --add jenkins

# Install The Jenkins CLI
$ wget http://localhost:8080/jnlpJars/jenkins-cli.jar
java -jar jenkins-cli.jar login --username Candidate-J5PaTIItaB --password ReanCloud20171!

curl http://localhost:8080/user/Candidate-J5PaTIItaB/configure
# https://isignal.github.io/notes/jenkins-cli.html
# Has several manual steps.
echo 'Candidate-J5PaTIItaB:897888b883355e3f009ebdad20f3103c' > jenkins_secret 
java -jar ./jenkins-cli.jar -s http://localhost:8080 -auth @jenkins_secret who-am-i

java -jar ./jenkins-cli.jar -s http://localhost:8080 -auth @jenkins_secret list-jobs

# At this point I have the Linux AMI setup with Jenkins, however I need to override the password.
# One option I am considering is to do a Post on the Admin URL by reading the file at sudo vi /var/lib/jenkins/secrets/initialAdminPassword
# Status Pending

# Install Ansible
sudo pip install ansible
PATH=$PATH:/usr/local/bin/ansible

sudo pip install boto3
