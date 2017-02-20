#!/bin/bash
for i in `cat jenkins_users`; do
	echo "Creating user account for $i in edpdev-jenkins"
	echo jenkins.model.Jenkins.instance.securityRealm.createAccount"(\"$i\", \"$i\")" | java -jar jenkins-cli.jar -noKeyAuth -s https://edpdev-jenkins.prokarmalabs.com groovy = --username "jenkins" and --password-file files/jenkins_dev_pass
	echo "Creating user account for $i in edpqa-jenkins"
	echo jenkins.model.Jenkins.instance.securityRealm.createAccount"(\"$i\", \"$i\")" | java -jar jenkins-cli.jar -noKeyAuth -s https://edpqa-jenkins.prokarmalabs.com groovy = --username "jenkins" and --password-file files/jenkins_qa_pass
	echo "Creating user account for $i in edpstg-jenkins"
	echo jenkins.model.Jenkins.instance.securityRealm.createAccount"(\"$i\", \"$i\")" | java -jar jenkins-cli.jar -noKeyAuth -s https://edpstg-jenkins.prokarmalabs.com groovy = --username "jenkins" and --password-file files/jenkins_stg_pass
	echo "Creating user account for $i in jenkinsci"
	echo jenkins.model.Jenkins.instance.securityRealm.createAccount"(\"$i\", \"$i\")" | java -jar jenkins-cli.jar -noKeyAuth -s https://jenkinsci.prokarmalabs.com groovy = --username "jenkins" and --password-file files/jenkinsci_pass
done
