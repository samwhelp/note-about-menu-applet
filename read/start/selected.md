---
title: Selected
nav_order: 2020
has_children: false
parent: 入門
---


# Selected

> Previous: [Create Menu](https://samwhelp.github.io/note-about-menu-applet/read/start/create-menu.html)


* [fzf](#fzf)
* [dmenu](#dmenu)
* [rofi](#rofi)
* [jgmenu](#jgmenu)




## fzf

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/fzf/selected.sh)

執行下面指令

``` sh
selected=$(echo -e "aaa\nbbb\nccc" | fzf)

echo "Selected: ${selected}"
```




## dmenu

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/dmenu/selected.sh)

執行下面指令

``` sh
selected=$(echo -e "aaa\nbbb\nccc" | dmenu -b -l 10)

echo "Selected: ${selected}"
```




## rofi

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/rofi/selected.sh)

執行下面指令

``` sh
selected=$(echo -e "aaa\nbbb\nccc" | rofi -dmenu)

echo "Selected: ${selected}"
```




## jgmenu

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/jgmenu/selected.sh)

執行下面指令

``` sh
selected=$(echo -e "aaa,val_aaa\nbbb,val_bbb\nccc,val_ccc" | jgmenu --simple --center --no-spawn)

echo "Selected: ${selected}"
```




> Next: [Modularize](https://samwhelp.github.io/note-about-menu-applet/read/start/modularize.html)
