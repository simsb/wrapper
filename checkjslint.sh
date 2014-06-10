#!/bin/bash
# script to diff jslint output between feature branch and active tracking branch
#
currentBranch=$(git branch | sed --quiet 's/* \(.*\)/\1/p')
activeTrackingBranch="$(cat ~/.gitsvnactivetrackingbranch)";
echo "current branch $currentBranch tracking branch $activeTrackingBranch"
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
echo "Starting jslinting..."
if [ -n "$(git status --porcelain)" ]
then
    echo [ "Branch has changed or untracked files. " ]
    exit
fi
git checkout $activeTrackingBranch
ant jslint > $HOME/lint_active_tracking_branch 
git checkout $currentBranch
ant jslint > $HOME/lint_current_branch 

diff $HOME/lint_active_tracking_branch $HOME/lint_current_branch

