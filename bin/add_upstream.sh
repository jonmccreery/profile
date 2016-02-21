#!/bin/bash

GIT_URL=$(git remote -v | grep fetch | awk -e '{ print $2 }' | grep https)

REMOTE_URL=$(echo ${GIT_URL} | sed -e 's/https:\/\//ssh:\/\/git@/g')

git remote add upstream_rw $REMOTE_URL
