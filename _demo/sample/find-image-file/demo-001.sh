#!/usr/bin/env bash


##
## ## orginal
##
## *https://github.com/trimap/photofind
##

#find ~/Pictures \( -iname "*.jpg" -or -iname "*.jpeg" -or -iname "*.png" -or -iname "*.tif" -or -iname "*.bmp" -or -iname "*.gif" -or -iname "*.xpm" -or -iname "*.nef" -or -iname "*.cr2" -or -iname "*.arw" \) -size +20k


##
## ## adjust
##

THE_IMAGE_DIR_PATH="${THE_IMAGE_DIR_PATH:=$HOME/Pictures}"

find "${THE_IMAGE_DIR_PATH}" \( -iname "*.jpg" -or -iname "*.jpeg" -or -iname "*.png" -or -iname "*.tif" -or -iname "*.bmp" -or -iname "*.gif" -or -iname "*.xpm" -or -iname "*.nef" -or -iname "*.cr2" -or -iname "*.arw" \)
