---
title: jgmenu
nav_order: 2024
has_children: false
parent: Modularize
grand_parent: 入門
---


# jgmenu

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/jgmenu/modularize.sh)

執行下面指令

``` sh
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
```
