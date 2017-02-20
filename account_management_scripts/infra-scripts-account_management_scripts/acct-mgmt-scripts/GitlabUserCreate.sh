#!/bin/bash

#################################################################
#### Author       :   Khamruddin Khamruddins                   ##
#### Description  :   Script to create user accounts in gitlab ##
#################################################################

#Creating User accounts in Gitlab.
for i in `cat git_users | awk {'print "email="$1"@prokarma.com&password=T3st@123&username="$1"&name="$2""'}`; do
    
#    echo "======================================================="
    echo -n "Creating user account for "
    echo "$i in edpdev-gitlab" | awk -F"&name=" {'print $2'}
    curl -s --header "PRIVATE-TOKEN: 1Mu4vfLr3uyJks7swCx2" -d $i "https://edpdev-gitlab.prokarmalabs.com/api/v3/users"; 
    echo -e ""

    echo -n "Creating user account for "
    echo "$i in edpqa-gitlab" | awk -F"&name=" {'print $2'}
    curl -s --header "PRIVATE-TOKEN: R4WJfY113esukpxeLAYA" -d $i "https://edpqa-gitlab.prokarmalabs.com/api/v3/users"; 
    echo -e ""

    echo -n "Creating user account for "
    echo "$i in edpstg-gitlab" | awk -F"&name=" {'print $2'}
    curl -s --header "PRIVATE-TOKEN: fPSRVPZgTc5jnphNgojh" -d $i "https://edpstg-gitlab.prokarmalabs.com/api/v3/users"; 
    echo -e ""
#    echo "======================================================="

done
