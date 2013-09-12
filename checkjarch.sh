#!/bin/bash
# script to diff jslint output between feature branch and active tracking branch
#
currentBranch=$(git branch | sed --quiet 's/* \(.*\)/\1/p')
activeTrackingBranch="$(cat ~/.gitsvnactivetrackingbranch)";

if [ -z "$activeTrackingBranch" ]
then
    echo "Run gitmaster to set the active tracking branch"
    exit
fi

if [ "$currentBranch" == "$activeTrackingBranch" ];
then
    echo "Can only run on a feature branch"
    exit
fi
echo "Starting jarching..."
if [ -n "$(git status --porcelain)" ]
then
    echo [ "Branch has changed or untracked files. " ]
    exit
fi
git checkout $activeTrackingBranch
ant jarch-mosaic > ~/jarch_$activeTrackingBranch
git checkout $currentBranch
ant jarch-mosaic > ~/jarch_$currentBranch

diff ~/jarch_$activeTrackingBranch ~/jarch_$currentBranch

