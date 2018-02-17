#!/bin/bash
#
# User data script which sets up Jenkins on Ubuntu using Puppet
#
# For example:
#
#     $ ec2-run-instances ami-5a19976a -t m1.small --region us-west-2 \
#           --key ec2-keypair --user-data-file Desktop/jenkins-user-script.sh
#     $ ssh -i ~/.ssh/ec2-keypair-us-west-2 \
#           ubuntu@ec2-xxx-xxx-xxx-xxx.us-west-2.compute.amazonaws.com
#
# This requires ports 22 and 8080 to be open
#
#     $ ec2-authorize --region us-west-2 default -p 22
#     $ ec2-authorize --region us-west-2 default -p 8080
#
# Cut your carbon, use us-west-2!
set -e -x

# resources
jenkins_module_src="https://raw.github.com/rdegges/puppet-jenkins/master/manifests/init.pp"

# puppet locations
manifests="/etc/puppet/manifests"
site_pp="$manifests/site.pp"
manifests_jenkins="$manifests/jenkins/manifests"
jenkins_init_pp="$manifests_jenkins/init.pp"

# ensure apt-get operations are noninteractive
export DEBIAN_FRONTEND=noninteractive

# update and upgrade the system
apt-get -y update && apt-get -y upgrade

# install puppet and git
apt-get -y install git puppet

# create puppet config
mkdir -p $manifests_jenkins
curl $jenkins_module_src > $jenkins_init_pp
echo 'include jenkins' > $site_pp

# run puppet in standalone mode
puppet apply $site_pp