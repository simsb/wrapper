#!/bin/bash
#  script which will only allow merging into the currently active svn tracking branck
currentBranch=$(git branch | sed --quiet 's/* \(.*\)/\1/p')
activeTrackingBranch="$(cat ~/.gitsvnactivetrackingbranch)";

if [ -z "$1" ]
then
    echo "Usage: gitsvncheckoutmaster.sh <branch>"
    exit
fi



 if [ -z "$activeTrackingBranch" ] || [ "$activeTrackingBranch" != "$1" ];
then
    echo "Can only switch to currently active svn tracking branch which is $activeTrackingBranch."
    exit
else
    echo "Checking out currently active tracking branch which is $activeTrackingBranch"
    git checkout $1

    exit
fi
