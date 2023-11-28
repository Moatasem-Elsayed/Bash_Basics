#!/bin/bash

# This bash script is designed to automate the process of creating a new directory,
# initializing a Git repository within it, creating a README.md and .gitignore file,
# and then pushing the repository to GitHub. The script takes the name of the repository
# as a command-line argument and uses the GitHub API to create a new repository with the
# given name. It then initializes the local directory as a Git repository, adds the necessary
# files, commits the initial changes, and pushes the repository to GitHub. The script also
# includes placeholders for GitHub username and token, which need to be replaced with actual credentials.

#######################################
# Bash Script for Creating GitHub Repo #
#######################################

# Get the current working directory
CURRENT_ENV=$(pwd)

# Check if a repository name is provided as an argument
if [ $# -eq 0 ]; then
    echo "repo name is missed!!"
else
    # Check if the repository directory already exists
    if [ -d $1 ]; then
        echo "repo exists!!"
    else
        # Create a new directory for the repository
        mkdir ${CURRENT_ENV}/$1
        cd ./$1
        # Create README.md and .gitignore files
        touch README.md
        touch .gitignore

        # Create a new repository on GitHub
        ###########################################
        ############## ADD YOUR NAME ##############
        ############## ADD YOUR TOKEN #############
        ###########################################
        # GitHub credentials
        # Your name on Github
        USERNAME=""
        TOKEN=""

        # Create a new repository on GitHub using the GitHub API
        REPO_NAME=$1
        curl -H "Authorization: token $TOKEN" https://api.github.com/user/repos -d '{"name":"'$REPO_NAME'"}'

        # Extract the SSH URL of the newly created repository
        SSH_URL=$(curl -s -H "Authorization: token $TOKEN" https://api.github.com/repos/$USERNAME/$REPO_NAME | jq -r '.ssh_url')
        # Initialize the local directory as a Git repository
        git init
        git branch -M main
        git remote add origin ${SSH_URL}
        git add .
        git commit -m "Initial commit"
        git push -u origin main
    fi
fi
