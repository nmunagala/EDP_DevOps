#!/bin/bash

###################################################################
#### Author       :   Khamruddin Khamruddins                     ##
#### Description  :   Script to add memebers to respective group ## 
###################################################################

#Get gitlab users user_ids
if [ ! -z "$1" ] && [ $1 == "dev" ];
then
	echo "Getting gitlab user_ids for edp$1-gitlab...."
        for i in `cat git_users |awk '{print $1}'`; do 
	
	   curl -s --request GET --header "PRIVATE-TOKEN: 1Mu4vfLr3uyJks7swCx2" \
	   https://edp$1-gitlab.prokarmalabs.com/api/v3/users?username=$i |awk -F,\"state\": '{print $1}' | \
	   awk -F\"id\": '{print $2}';

        done > files/GitlabUserids

        #Add members to Gitlab edp group

	#Merge GitlabUserids and git_users files
	awk 'FNR==NR{a[FNR]=$1; next}{print a[FNR],$1 " " $2 " " $3}' files/GitlabUserids git_users > files/GitlabGroupLevelAccess

	echo "Adding users to "edp" group in edp$1-gitlab..."
	for i in `cat files/GitlabGroupLevelAccess | awk '{print "user_id="$1"&access_level="$4""}'`; do 

	   curl -s --request POST --header "PRIVATE-TOKEN: 1Mu4vfLr3uyJks7swCx2" \
	   -d $i https://edp$1-gitlab.prokarmalabs.com/api/v3/groups/35/members && echo "";

	done


elif [ ! -z "$1" ] && [ $1 == "qa" ];
then
	echo "Getting gitlab user_ids for edp$1-gitlab...."
        for i in `cat git_users |awk '{print $1}'`; do 
	
	   curl -s --request GET --header "PRIVATE-TOKEN: R4WJfY113esukpxeLAYA" \
	   https://edp$1-gitlab.prokarmalabs.com/api/v3/users?username=$i |awk -F,\"state\": '{print $1}' | \
	   awk -F\"id\": '{print $2}';

        done > files/GitlabUserids

        #Add members to Gitlab edp group

	#Merge GitlabUserids and git_users files
	awk 'FNR==NR{a[FNR]=$1; next}{print a[FNR],$1 " " $2 " " $3}' files/GitlabUserids git_users > files/GitlabGroupLevelAccess

	echo "Adding users to "edp" group in edp$1-gitlab..."
	for i in `cat files/GitlabGroupLevelAccess | awk '{print "user_id="$1"&access_level="$4""}'`; do 

	   curl -s --request POST --header "PRIVATE-TOKEN: R4WJfY113esukpxeLAYA" \
	   -d $i https://edp$1-gitlab.prokarmalabs.com/api/v3/groups/35/members && echo "";

	done

elif [ ! -z "$1" ] && [ $1 == "stg" ];
then
	echo "Getting gitlab user_ids for edp$1-gitlab...."
        for i in `cat git_users |awk '{print $1}'`; do 
	
	   curl -s --request GET --header "PRIVATE-TOKEN: fPSRVPZgTc5jnphNgojh" \
	   https://edp$1-gitlab.prokarmalabs.com/api/v3/users?username=$i |awk -F,\"state\": '{print $1}' | \
	   awk -F\"id\": '{print $2}';

        done > files/GitlabUserids

        #Add members to Gitlab edp group

	#Merge GitlabUserids and git_users files
	awk 'FNR==NR{a[FNR]=$1; next}{print a[FNR],$1 " " $2 " " $3}' files/GitlabUserids git_users > files/GitlabGroupLevelAccess

	echo "Adding users to "edp" group in edp$1-gitlab..."
	for i in `cat files/GitlabGroupLevelAccess | awk '{print "user_id="$1"&access_level="$4""}'`; do 

	   curl -s --request POST --header "PRIVATE-TOKEN: fPSRVPZgTc5jnphNgojh" \
	   -d $i https://edp$1-gitlab.prokarmalabs.com/api/v3/groups/3/members && echo "";

	done
else 
	echo "USAGE: sh GitlabGroupAccess.sh dev|qa|stg";
fi
