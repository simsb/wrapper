#!/bin/bash
# script  to set the active master svn tracking branch
# will only run if that master is checked out


echo "Simple wrappers around commonly used git commands to prevent"
echo "unintended merging in git of branches in SVN"
echo "gitsetmaster.sh <branch>  make a record of the svn tracking branch that is active"
echo "Usage:"
echo "gitbranch.sh <branch>   make a branch of the current svn tracking branch"

echo "gitcheckoutmaster.sh <branch>   checkout the active svn tracking branch"

echo "gitsvnrebase.sh    rebase the active tracking branch from svn"

echo "gitsvnshowmaster.sh    show the active tracking branch"

echo "gitsvnhelp.sh     show this help"
