#!/bin/bash
# create a feature branch from the active tracking branch
# adds an entry to the list of feature branches created for the branch
currentBranch=$(git branch | sed --quiet 's/* \(.*\)/\1/p')
activeTrackingBranch="$(cat ~/.gitsvnactivetrackingbranch)";

if [ -z "$activeTrackingBranch" ]
then
    echo "Run gitmaster to set the active tracking branch"
    exit
fi

if [ "$currentBranch" != "$activeTrackingBranch" ];
then
    echo "Can only branch from the $activeTrackingBranch branch."
    exit
else
    echo "Branching from $activeTrackingBranch"
    git checkout -b "$activeTrackingBranch.$1"
    echo "$activeTrackingBranch.$1">>~/.$activeTrackingBranch
    exit
fi
