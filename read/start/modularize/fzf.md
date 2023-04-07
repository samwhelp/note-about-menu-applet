---
title: fzf
nav_order: 2021
has_children: false
parent: Modularize
grand_parent: 入門
---


# fzf

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/fzf/modularize.sh)

執行下面指令

``` sh
menu_list () {
	echo -e "aaa\nbbb\nccc"
}

menu_factory () {
	fzf
}

menu_start () {
	 menu_list | menu_factory
}

selected="$(menu_start)"

echo "Selected: ${selected}"
```
