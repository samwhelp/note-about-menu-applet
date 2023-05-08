#!/usr/bin/env bash


##
## ## orginal
##
##


#find . -type f -exec file --mime-type {} \+ | awk -F: '{if ($2 ~/image\//) printf("%s%c", $1, 0)}' | tar -cvf /tmp/file.tar --null -T -


##
## ## adjust
##

THE_DEFAULT_IMAGE_DIR_PATH="${THE_DEFAULT_IMAGE_DIR_PATH:=$HOME/Pictures}"

find "${THE_DEFAULT_IMAGE_DIR_PATH}" -type f -exec file --mime-type {} \+ | awk -F: '{if ($2 ~/image\//) printf("%s%c", $1, 0)}' | tar -cvf /tmp/file.tar --null -T - | cut -d ':' -f 1
