#!/usr/bin/env bash


menu_content () {
	echo -e "aaa,val_aaa\nbbb,val_bbb\nccc,val_ccc"
}

menu_factory () {
	jgmenu --simple --center --no-spawn
}

menu_start () {
	 menu_content | menu_factory
}

selected="$(menu_start)"

echo "Selected: ${selected}"
