FROM bitnami/jenkins:latest

RUN apt-get update
RUN apt-get install -y python 
RUN apt-get install -y python-pip
 
# Install app dependencies
RUN pip install --upgrade pip
# RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367
# RUN apt-get update
RUN apt-get install -y ansible
RUN pip install boto3
RUN pip install boto
RUN mkdir /ansible-elk-playbook 
COPY ./ansible-elk-playbook /ansible-elk-playbook
ENV AWS_ACCESS_KEY_ID="XXXXX" 
ENV AWS_SECRET_ACCESS_KEY="XXXXX"

# CMD ansible --version