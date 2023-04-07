#!/usr/bin/env bash


menu_content () {
	echo -e "aaa\nbbb\nccc"
}

menu_factory () {
	dmenu -b -l 10
}

menu_start () {
	 menu_content | menu_factory
}

selected="$(menu_start)"

echo "Selected: ${selected}"
