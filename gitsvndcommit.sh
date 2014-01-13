#!/bin/bash
# script to do an svn rebase on a working branch in a git repository
# will only run if 'master' is checked out
currentBranch=$(git branch | sed --quiet 's/* \(.*\)/\1/p')
activeTrackingBranch="$(cat ~/.gitsvnactivetrackingbranch)";

if [ -z "$activeTrackingBranch" ]
then
    echo "Run gitsvnsetmaster.sh to set the current active tracking branch"
    exit
fi

if [ -n "$(git status --porcelain)" ]
    then
        echo [ "This branch has changed or untracked files which must be committed or stashed before dcommit." ]
        exit
fi

if [[ `grep $currentBranch ~/.$activeTrackingBranch` =~ $currentBranch ]]
then
    echo "running git svn dcommit"
    git svn dcommit
    exit
fi


if [ "$currentBranch" != "$activeTrackingBranch" ];
then
    echo "Can only run dcommit on $activeTrackingBranch"
    exit
fi
