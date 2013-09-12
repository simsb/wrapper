#!/bin/bash
#  script which will only allow merging into the currently active svn tracking branck
currentBranch=$(git branch | sed --quiet 's/* \(.*\)/\1/p')
activeTrackingBranch="$(cat ~/.gitsvnactivetrackingbranch)";

if [ -z "$1" ]
then
    echo "Usage: gitsvnmerge.sh <branch>"
    exit
fi



 if [ -z "$activeTrackingBranch" ] || [ "$activeTrackingBranch" != "$1" ];
then
    echo "script incomplete"
    exit
else
    echo "script incomplete"

    exit
fi

