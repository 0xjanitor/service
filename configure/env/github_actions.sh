#!/bin/sh
source env.sh

if [ "$SHARKCI_URL" != "" ];
then

elif [ "$GITHUB_ACTIONS" != '' ]
then
  add "GITHUB_ACTIONS"
  add "GITHUB_HEAD_REF"
  add "GITHUB_REF"
  add "GITHUB_REPOSITORY"
  add "GITHUB_RUN_ID"
  add "GITHUB_SHA"
  add "GITHUB_WORKFLOW"
  
fi
