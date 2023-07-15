#! /bin/bash

# provide git repo details

repo(){

        curl -L -s -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $token" -H "X-GitHub-Api-Version: 2022-11-28"   https://api.github.com/users/$git_name/repos | jq '.[].name'
        
}

echo "please provide git-owner name"
read git_name
echo "please provide token"
read token

echo "do you want to get or create or delete the repo details "
read get_or_delete

if [ "$get_or_delete" = "get" ]
then    
       repo
       echo "please provide reponame to get details"
       read reponame
       curl -L -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $token" -H "X-GitHub-Api-Version: 2022-11-28"  https://api.github.com/repos/$git_name/$reponame
elif [ "$get_or_delete" = "delete" ]
then        	
        repo
	echo "please provide repo name to delete"
	read reponame
        curl -L -X DELETE -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $token" -H "X-GitHub-Api-Version: 2022-11-28" https://api.github.com/repos/$git_name/$reponame

elif [ "$get_or_delete" = "create" ]
then       
	echo "please provide name to new repo"
       read new_repo
	curl -L -X POST -H "Accept: application/vnd.github+json" -H "Authorization: Bearer $token" -H "X-GitHub-Api-Version: 2022-11-28" -d '{"name":"$1","description":"$new_repo is your new repo","homepage":"https://github.com","private":false,"is_template":true}' https://api.github.com/user/repos
	
else
	 echo " please provide correct details either get or create or delete "
	 

fi
