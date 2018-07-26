#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo -e "\033[0;32mDeployment started. ${bold}Go${normal} ...\033[0m"
echo -e "\033[0;32mDeploying site to ${bold}https://github.com/sumantabose/sumantabose.github.io${normal} ...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Checkout to master branch
git checkout master
# Update username, email and credential
git config --local user.name "sumantabose"
git config --local user.email "sumantabose@gmail.com"
git config credential.username "sumantabose"
# Add CNAME
echo sumantabose.me > CNAME
# Check status
git status
# Add changes to git.
git add .

# Commit changes.
msg="Rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..

######

echo -e "\033[0;32mDeploying updates to ${bold}https://github.com/sumantabose/source${normal} ...\033[0m"

# Checkout to master branch
git checkout master
# Update username, email and credential
git config --local user.name "sumantabose"
git config --local user.email "sumantabose@gmail.com"
git config credential.username "sumantabose"
# Check status
git status
# Add changes to git.
git add .

# Commit changes.
msg="Rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

echo -e "\033[0;32mDeployment complete. ${bold}Done${normal} ...\033[0m"
