#!/usr/bin/env bash

#
# Copyright 2016- tsumuradev@outlook.com
# All right reserved.
#

GIT_DEFAULT_NAME="tsumura"
GIT_DEFAULT_EMAIL="tsumuradev@outlook.com"

GIT_CONFIG_STR=$(cat << EOS
[core]
	repositoryformatversion = 0
	filemode = true
	bare = false
	logallrefupdates = true
[user]
	name = $GIT_DEFAULT_NAME
	email = $GIT_DEFAULT_EMAIL
[remote "origin"]
	url = https://github.com/tumulabo/PublicConfs.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
	remote = origin
	merge = refs/heads/master
EOS
)

echo "## Update git config"

if [ $# -eq 2 ]; then
	git config --local user.name $1
	git config --local user.email $2
else
	echo "$GIT_CONFIG_STR"
	echo "$GIT_CONFIG_STR" > ./.git/config 
fi

echo "## Finished."
