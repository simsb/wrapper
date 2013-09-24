#!/bin/bash
if [ -z "$1" ]
then
    echo "Usage: gitsvntrackbranch.sh <branch> <path>" 
    exit
fi
echo "Adding branch http://svn.corelogic.local/svn/main/branches/$2/$1 to git svn tracking branches"
read -p "Confirm this is correct (Yy)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
     echo "Adding new tracking branch"
     git config --add svn-remote.dev-$1.url http://svn.corelogic.local/svn/main/branches/$2/$1

     git config --add svn-remote.dev-$1.fetch :refs/remotes/git-svn-dev-$1

     git svn fetch dev-$1
     git branch --track dev-$1 git-svn-dev-$1
     git checkout dev-$1
     git svn rebase
fi
