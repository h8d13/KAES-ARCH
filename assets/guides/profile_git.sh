#!/bin/bash

ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
cat ~/.ssh/id_ed25519.pub

#Paste it into github general settings of your profile
#git remote set-url origin https://github.com/OWNER/REPOSITORY.git.
# or
#git remote add origin https://github.com/OWNER/REPOSITORY.git
# then git remote -v 

# git pull will  work after a regular cloning operation without needing ssh. 
