#!/usr/bin/env bash


##
## ## orginal
##
##


#find . -type f |
#	file --mime-type -f - |
#	grep -F image/ |
#	rev | cut -d : -f 2- | rev


##
## ## adjust
##

THE_DEFAULT_IMAGE_DIR_PATH="${THE_DEFAULT_IMAGE_DIR_PATH:=$HOME/Pictures}"

find "${THE_DEFAULT_IMAGE_DIR_PATH}" -type f |
	file --mime-type -f - |
	grep -F image/ |
	rev | cut -d : -f 2- | rev
