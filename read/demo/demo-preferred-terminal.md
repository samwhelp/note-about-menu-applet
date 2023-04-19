---
title: demo-preferred-terminal
nav_order: 8060
has_children: false
parent: 範例
---


# demo-preferred-terminal


## Link

* Terminal 探索筆記 / 設定 / [Preferred Applications](https://samwhelp.github.io/note-about-terminal/read/terminal/sakura/config-preferred-applications.html)


## Project

* [demo-preferred-terminal](https://github.com/samwhelp/note-about-menu-applet/tree/gh-pages/_demo/prototype/menu-applet/demo-application/demo-preferred-terminal)


## 建構基礎

> 設定採用首選Terminal

| 環境 |
| --- |
| [gnome-shell](#gnome-shell) |
| [cinnamon](#cinnamon) |
| [mate](#mate) |
| [xfce](#xfce) |


### gnome-shell

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-preferred-terminal/preferred-terminal.sh#L118-L145)

``` sh
gsettings set org.gnome.desktop.default-applications.terminal exec "sakura"
```


### cinnamon

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-preferred-terminal/preferred-terminal.sh#L147-L174)

``` sh
gsettings set org.cinnamon.desktop.default-applications.terminal exec "sakura"
```


### mate

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-preferred-terminal/preferred-terminal.sh#L176-L203)

``` sh
gsettings set org.mate.applications-terminal exec "sakura"
```


### xfce

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-preferred-terminal/preferred-terminal.sh#L205-L210)

``` sh
## TODO
```

