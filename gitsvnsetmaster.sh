#!/bin/bash
# script  to set the active master svn tracking branch
# will only run if that master is checked out

currentBranch=$(git branch | sed --quiet 's/* \(.*\)/\1/p')
 
if [ -z "$1" ]
then
    echo "Usage:    gitsvnsetmaster.sh <branch>"
    exit
fi

if [ "$currentBranch" != "$1" ];
then
    echo "Currently on the $currentBranch branch. Can only run this when on $1 branch."
    echo "Use \"git checkout $1\" to switch to $1 branch then try this again."
    exit
else
    echo "Now operating on $1 svn tracking branch"
    echo $1 > ~/.gitsvnactivetrackingbranch
    touch ~/.$1
    exit
fi
