---
title: Selected
nav_order: 2020
has_children: false
parent: 入門
---


# Selected


## fzf

執行下面指令

``` sh
selected=$(echo -e "aaa\nbbb\nccc" | fzf)

echo "Selected: ${selected}"
```

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/fzf/selected.sh)


## demnu

執行下面指令

``` sh
selected=$(echo -e "aaa\nbbb\nccc" | dmenu -b -l 10)

echo "Selected: ${selected}"
```

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/demnu/selected.sh)


## rofi

執行下面指令

``` sh
selected=$(echo -e "aaa\nbbb\nccc" | rofi -dmenu)

echo "Selected: ${selected}"
```

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/rofi/selected.sh)


## jgmenu

執行下面指令

``` sh
selected=$(echo -e "aaa,val_aaa\nbbb,val_bbb\nccc,val_ccc" | jgmenu --simple --center --no-spawn)

echo "Selected: ${selected}"
```

* [範例](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-start/jgmenu/selected.sh)

