#!/usr/bin/env bash


menu_content () {
	echo -e "aaa\nbbb\nccc"
}

menu_factory () {
	fzf
}

menu_start () {
	 menu_content | menu_factory
}

selected="$(menu_start)"

echo "Selected: ${selected}"
