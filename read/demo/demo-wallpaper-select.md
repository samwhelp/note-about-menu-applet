---
title: demo-wallpaper-select
nav_order: 8030
has_children: false
parent: 範例
---


# demo-wallpaper-select


## Project

* [demo-wallpaper-select](https://github.com/samwhelp/note-about-menu-applet/tree/gh-pages/_demo/prototype/menu-applet/demo-application/demo-wallpaper-select)


## 建構基礎

> 設定桌面圖片

| 環境 |
| --- |
| [gnome-shell](#gnome-shell) |
| [cinnamon](#cinnamon) |
| [mate](#mate) |
| [xfce](#xfce) |
| [feh](#feh) |
| [pcmanfm](#pcmanfm) |
| [pcmanfm-qt](#pcmanfm-qt) |


### gnome-shell

> [程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-wallpaper-select/wallpaper-select.sh#L137-L158)

``` sh
gsettings set org.gnome.desktop.background picture-uri "file:///usr/share/backgrounds/default.jpg"

gsettings set org.gnome.desktop.background picture-uri-dark "file:///usr/share/backgrounds/default.jpg"

gsettings set org.gnome.desktop.screensaver picture-uri "file:///usr/share/backgrounds/default.jpg"
```


### cinnamon

> [程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-wallpaper-select/wallpaper-select.sh#L160-L182)

``` sh
gsettings set org.cinnamon.desktop.background picture-uri "file:///usr/share/backgrounds/default.jpg"

gsettings set org.cinnamon.desktop.background picture-options "zoom"
```


### mate

> [程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-wallpaper-select/wallpaper-select.sh#L184-L204)

``` sh
gsettings set org.mate.background picture-filename "/usr/share/backgrounds/default.jpg"

gsettings set org.mate.background picture-options "zoom"
```


### xfce

> [程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-wallpaper-select/wallpaper-select.sh#L206-L245)

``` sh
local screen=`xrandr --listactivemonitors | awk -F ' ' 'END {print $1}' | tr -d \:`
local monitor=`xrandr --listactivemonitors | awk -F ' ' 'END {print $2}' | tr -d \*+`


xfconf-query --channel xfce4-desktop --property "/backdrop/screen${screen}/monitor${monitor}/workspace0/last-image" --set "/usr/share/backgrounds/default.jpg" --type 'string' --create

xfconf-query --channel xfce4-desktop --property "/backdrop/screen${screen}/monitor${monitor}/workspace0/image-style" --set 5 --type 'int' --create

xfconf-query --channel xfce4-desktop --property "/backdrop/single-workspace-mode" --set 'true' --type 'bool' --create
```


### feh

> [程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-wallpaper-select/wallpaper-select.sh#L115-L135)

``` sh
feh --bg-scale "/usr/share/backgrounds/default.jpg"
```


### pcmanfm

> [程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-wallpaper-select/wallpaper-select.sh#L247-L274)

``` sh
pcmanfm --set-wallpaper "/usr/share/backgrounds/default.jpg"

pcmanfm --wallpaper-mode "fit"
```


### pcmanfm-qt

> [程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-wallpaper-select/wallpaper-select.sh#L276-L303)

``` sh
pcmanfm-qt --set-wallpaper "/usr/share/backgrounds/default.jpg"

pcmanfm-qt --wallpaper-mode "fit"
```
