#!/usr/bin/env bash


##
## ## orginal
##
##

#find . -type f -print0 |
#	xargs -0 file --mime-type |
#	grep -F 'image/' |
#	cut -d ':' -f 1


##
## ## adjust
##

THE_DEFAULT_IMAGE_DIR_PATH="${THE_DEFAULT_IMAGE_DIR_PATH:=$HOME/Pictures}"

find "${THE_DEFAULT_IMAGE_DIR_PATH}" -type f -print0 |
	xargs -0 file --mime-type |
	grep -F 'image/' |
	cut -d ':' -f 1
