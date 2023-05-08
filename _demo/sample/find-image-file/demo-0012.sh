#!/usr/bin/env bash


##
## ## orginal
##
##


#find . -type f -exec file --mime-type {} \+ | awk -F: '{if ($2 ~/image\//) print $1}'


##
## ## adjust
##

THE_DEFAULT_IMAGE_DIR_PATH="${THE_DEFAULT_IMAGE_DIR_PATH:=$HOME/Pictures}"

find "${THE_DEFAULT_IMAGE_DIR_PATH}" -type f -exec file --mime-type {} \+ | awk -F: '{if ($2 ~/image\//) print $1}' | cut -d ':' -f 1
