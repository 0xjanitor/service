#!/bin/bash

for bb in $(
  for b in $(git branch --remote); do 
    echo $b; 
  done | cut -d '/' -f2) 
do 
  [ "$bb" != "HEAD" ] && [ "$bb" != "->" ] && git checkout $bb; 
done

git checkout develop
