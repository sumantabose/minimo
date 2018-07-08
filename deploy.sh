#!/bin/bash

echo -e "\033[0;32mDeploying site to GitHub github.com/sumantabose.github.io ...\033[0m"

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Checkout to master branch
git checkout master
# Update username
git config credential.username "sumantabose"
# Check status
git status
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..

######

echo -e "\033[0;32mDeploying updates to GitHub github.com/new-site ...\033[0m"

# Checkout to master branch
git checkout master
# Update username
git config credential.username "sumantabose"
# Check status
git status
# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master