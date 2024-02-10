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
| [budgie](#budgie) |
| [cinnamon](#cinnamon) |
| [mate](#mate) |
| [xfce](#xfce) |


### gnome-shell

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-mouse-button-modifier/mouse-button-modifier.sh#L114-L147)

``` sh
settings set org.gnome.desktop.wm.preferences mouse-button-modifier "<Super>"

gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
```


### budgie


``` sh
settings set org.gnome.desktop.wm.preferences mouse-button-modifier "<Super>"

gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true
```


### cinnamon

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-mouse-button-modifier/mouse-button-modifier.sh#L149-L182)

``` sh
gsettings set org.cinnamon.desktop.wm.preferences mouse-button-modifier "<Super>"

gsettings set org.cinnamon.desktop.wm.preferences resize-with-right-button true
```


### mate

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-mouse-button-modifier/mouse-button-modifier.sh#L184-L212)

``` sh
gsettings set org.mate.Marco.general mouse-button-modifier "<Super>"

gsettings set org.mate.Marco.general resize-with-right-button true
```


### xfce

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-mouse-button-modifier/mouse-button-modifier.sh#L214-L243)


**Super**

``` sh
xfconf-query --channel xfwm4 --property "/general/easy_click" --set "Super" --type "string" --create
```

**Alt**

``` sh
xfconf-query --channel xfwm4 --property "/general/easy_click" --set "Alt" --type "string" --create
```


**To Check**

``` sh
grep 'easy_click' ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml
```


## 相關筆記

| 相關筆記 |
| ------- |
| Gnome Shell 探索筆記 / [設定 Mouse Button Modifier](https://samwhelp.github.io/note-about-gnome-shell/read/howto/config-mouse-button-modifier.html) |
| Budgie Desktop 探索筆記 / [設定 Mouse Button Modifier](https://samwhelp.github.io/note-about-budgie/read/howto/config-mouse-button-modifier.html) |
