FROM bitnami/jenkins:latest

RUN apt-get update
RUN apt-get install -y python 
RUN apt-get install -y python-pip
RUN apt-get install -y nano
# Install app dependencies
RUN pip install --upgrade pip
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
# RUN apt-get update
RUN apt-get install -y ansible
RUN pip install boto3
RUN pip install boto
RUN pip install awscli

# Creating the Folder and then granting permissions to the folder so that the Ansible Playbook can then update the hosts file
RUN mkdir -m 777 /ansible-elk-playbook 
COPY ./ansible-elk-playbook /ansible-elk-playbook

RUN mkdir -m 777 /ansible-elk
COPY ./ansible-elk /ansible-elk

RUN mkdir -m 777 /ansible-elk-revised
COPY ./ansible-elk-revised /ansible-elk-revised

# RUN mkdir ~/.ssh
# COPY ./WitDevEnvironment.pem ~/.ssh
# COPY ./WitDevEnvironment.pem /ansible-elk
# COPY ./WitDevEnvironment.pem /ansible-elk-revised

# ENV AWS_ACCESS_KEY_ID="XXX" 
# ENV AWS_SECRET_ACCESS_KEY="XXXX"
ENV ANSIBLE_HOST_KEY_CHECKING=False

# CMD ansible --version