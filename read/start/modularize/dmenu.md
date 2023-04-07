---
title: dmenu
nav_order: 2022
has_children: false
parent: Modularize
grand_parent: 入門
---


# dmenu

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/dmenu/modularize.sh)

執行下面指令

``` sh
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
```
