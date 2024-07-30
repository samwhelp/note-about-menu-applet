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
```




## 相關筆記

| Link | GitHub |
| ---- | ------ |
| [Fzf 探索筆記](https://samwhelp.github.io/note-about-fzf/) | [GitHub](https://github.com/samwhelp/note-about-fzf) |
