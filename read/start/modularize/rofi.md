---
title: rofi
nav_order: 2023
has_children: false
parent: Modularize
grand_parent: 入門
---


# rofi

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/rofi/modularize.sh)

執行下面指令

``` sh
menu_list () {
	echo -e "aaa\nbbb\nccc"
}

menu_factory () {
	rofi -dmenu
}

menu_start () {
	 menu_list | menu_factory
}

selected="$(menu_start)"

echo "Selected: ${selected}"
```
