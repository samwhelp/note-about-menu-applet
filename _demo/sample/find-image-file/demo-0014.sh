#!/usr/bin/env bash


##
## ## orginal
##
##


#find . -type f -exec file {} \; | grep -o -P '^.+: \w+ image'


##
## ## adjust
##

THE_DEFAULT_IMAGE_DIR_PATH="${THE_DEFAULT_IMAGE_DIR_PATH:=$HOME/Pictures}"

find "${THE_DEFAULT_IMAGE_DIR_PATH}" -type f -exec file {} \; | grep -o -P '^.+: \w+ image' | cut -d ':' -f 1
