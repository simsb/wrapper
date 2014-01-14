#!/bin/bash
#  script which will only allow merging into the currently active svn tracking branck
currentBranch=$(git branch | sed --quiet 's/* \(.*\)/\1/p')
activeTrackingBranch="$(cat ~/.gitsvnactivetrackingbranch)";




 if [ -z "$activeTrackingBranch" ];
then
    echo "no active tracking branch - run gitsvnsetmaster.sh"
    exit
else
    echo "Checking out currently active tracking branch which is $activeTrackingBranch"
    git checkout $activeTrackingBranch

    exit
fi
