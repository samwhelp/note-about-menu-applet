---
title: demo-mouse-button-modifier
nav_order: 8070
has_children: false
parent: 範例
---


# demo-mouse-button-modifier


## Project

* [demo-mouse-button-modifier](https://github.com/samwhelp/note-about-menu-applet/tree/gh-pages/_demo/prototype/menu-applet/demo-application/demo-mouse-button-modifier)


## 建構基礎

> 設定「滑鼠按鍵」搭配「鍵盤按鍵」，用來「移動視窗」或「更改視窗大小」

| 環境 |
| --- |
| [gnome-shell](#gnome-shell) |
| [cinnamon](#cinnamon) |
| [mate](#mate) |
| [xfce](#xfce) |


### gnome-shell

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-mouse-button-modifier/mouse-button-modifier.sh#L118-L145)

``` sh
settings set org.gnome.desktop.wm.preferences mouse-button-modifier "<Super>"

gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
```


### cinnamon

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-mouse-button-modifier/mouse-button-modifier.sh#L147-L174)

``` sh
gsettings set org.cinnamon.desktop.wm.preferences mouse-button-modifier "<Super>"

gsettings set org.cinnamon.desktop.wm.preferences resize-with-right-button true
```


### mate

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-mouse-button-modifier/mouse-button-modifier.sh#L176-L203)

``` sh
gsettings set org.mate.Marco.general mouse-button-modifier "<Super>"

gsettings set org.mate.Marco.general resize-with-right-button true
```


### xfce

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-mouse-button-modifier/mouse-button-modifier.sh#L205-L210)

``` sh
## TODO
```

