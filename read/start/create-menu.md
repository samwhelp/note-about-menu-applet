---
title: Create Menu
nav_order: 2010
has_children: false
parent: 入門
---


# Create Menu


## fzf

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/fzf/start.sh)

執行下面指令

``` sh
echo -e "aaa\nbbb\nccc" | fzf
```


## dmenu

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/dmenu/start.sh)

執行下面指令

``` sh
echo -e "aaa\nbbb\nccc" | dmenu -b -l 10
```


## rofi

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/rofi/start.sh)

執行下面指令

``` sh
echo -e "aaa\nbbb\nccc" | rofi -dmenu
```


## jgmenu

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/jgmenu/start.sh)

執行下面指令

``` sh
echo -e "aaa\nbbb\nccc" | jgmenu --simple --center --no-spawn
```

執行下面指令

``` sh
echo -e "aaa,val_aaa\nbbb,val_bbb\nccc,val_ccc" | jgmenu --simple --center --no-spawn
```

