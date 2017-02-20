#Jenkins and gitlab account management for CI/CD, DEV, QA and STG environments.



How to create user account(s) in jenkins?

Please decrypt the below files.
    - files/jenkins_dev_pass.gpg
    - files/jenkins_qa_pass.gpg
    - files/jenkins_stg_pass.gpg
    - files/jenkinsci_pass.gpg

Here is the command to decrypt:
   gpg <filename>.gpg

 1. Clone "account_management_scripts" branch from "edp/infra-scripts".
    git clone -b account_management_scripts --single-branch https://gitlab.prokarmalabs.com/edp/infra-scripts.git

 2. Change the directory to infra-scripts/acct-mgmt-scripts
    cd infra-scripts/acct-mgmt-scripts

 3. Add usernames in "jenkins_user" file.
    
    eg. To create user accounts for akumar and kkhamruddin, add the usernames to jenkins_user

        cat jenkins_user
    
        kkhamruddin
        akumar

 4. Run "jenkins_user_create.sh"
    sh jenkins_user_create.sh

    Expected output:
       
       Creating user account for kkhamruddin in edpdev-jenkins
       Creating user account for kkhamruddin in edpqa-jenkins
       Creating user account for kkhamruddin in edpstg-jenkins
       Creating user account for kkhamruddin in jenkinsci

    Note:
     - If the user already exists then it will throw a message as "Bad Credentials".


How to create user account(s) in gitlab?


 1. Clone "account_management_scripts" branch from "edp/infra-scripts".
    git clone -b account_management_scripts --single-branch https://gitlab.prokarmalabs.com/edp/infra-scripts.git

 2. Change the directory to infra-scripts/acct-mgmt-scripts
    cd infra-scripts/acct-mgmt-scripts

 3. Add user details in "git_users" file.
    
    eg. To create user accounts for tsrimahesh and kkhamruddin, add this line "Username Fullname Accesslevel" to git_users

        cat git_users
    
	akumar AnandKumar 40
	tsrimahesh MaheshTalatam 40
	kkhamruddin KhamruddinKhamruddins 40
	chraghavendra VenkataRaghavendraDileepChappalli 30

    Here
      - kkhamruddin is the username
      - KhamruddinKhamruddins is the users fullname (No spaces in the name)
      - 40 is the Gitlab Access Level.

       
    Note:
     - The access levels are defined in the Gitlab::Access module. Currently, these levels are recognized:
	     10 => Guest access
	     20 => Reporter access
	     30 => Developer access
	     40 => Master access
	     50 => Owner access # Only valid for groups

 4. Run "GitlabUserCreate.sh" script. This will create user accounts in gitlab.
    sh GitlabUserCreate.sh

    Expected Output:

       Creating user account for kkhamruddin in edpdev-gitlab
       Creating user account for kkhamruddin in edpqa-gitlab
       Creating user account for kkhamruddin in edpstg-gitlab

    Note:
     - If the user already exists then it will throw a message as "Email already exists".


How to add members to the gitlab group?


 1. Clone "account_management_scripts" branch from "edp/infra-scripts".
    git clone -b account_management_scripts --single-branch https://gitlab.prokarmalabs.com/edp/infra-scripts.git

 2. Change the directory to infra-scripts/acct-mgmt-scripts
    cd infra-scripts/acct-mgmt-scripts

 3. Run "GitlabGroupAccess.sh" script with one runtime argument.
    
     sh GitlabGroupAccess.sh dev    #For DEV environment
	 sh GitlabGroupAccess.sh qa     #For QA environment
	 sh GitlabGroupAccess.sh stg    #For STG environment

    Expected output:

      - Getting gitlab user_ids for edpdev-gitlab....
        Adding users to "edp" group in edpdev-gitlab...

      - Getting gitlab user_ids for edpqa-gitlab....
        Adding users to "edp" group in edpdev-gitlab...

      - Getting gitlab user_ids for edpqa-gitlab....
        Adding users to "edp" group in edpdev-gitlab...

    Note:
      - If the member already exists in gitlab "edp" group then it will throw a message as "Member already exists"


Here are the application(tools) URLs :
======================================

CI/CD:

jenkins
https://jenkinsci.prokarmalabs.com

DEV:

jenkins
https://edpdev-jenkins.prokarmalabs.com

gitlab
https://edpdev-gitlab.prokarmalabs.com

 
QA:

jenkins
https://edpqa-jenkins.prokarmalabs.com

gitlab
https://edpqa-gitlab.prokarmalabs.com

STG:

jenkins
https://edpstg-jenkins.prokarmalabs.com

gitlab
https://edpstg-gitlab.prokarmalabs.com
