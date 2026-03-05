---
title: demo-style-select
nav_order: 8020
has_children: false
parent: 範例
---


# demo-style-select



## 主題

* [Project](#project)
* [建構基礎](#建構基礎)




## Project

* [demo-style-select](https://github.com/samwhelp/note-about-menu-applet/tree/gh-pages/_demo/prototype/menu-applet/demo-application/demo-style-select)




## 建構基礎

> 設定外觀(佈景主題)

| 環境 |
| --- |
| [gnome-shell](#gnome-shell) |
| [xfce](#xfce) |
| [mate](#mate) |
| [cinnamon](#cinnamon) |






### gnome-shell

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-style-select/style-select.sh#L147-L239)

``` sh

gsettings set org.gnome.desktop.wm.preferences theme "Orchis-Dark"

gsettings set org.gnome.desktop.interface gtk-theme "Orchis-Dark"

gsettings set org.gnome.desktop.interface icon-theme "Citrus-red-dark"

gsettings set org.gnome.desktop.interface cursor-theme "breeze_cursors"

gsettings set org.gnome.desktop.interface cursor-size "24"

gsettings set org.gnome.desktop.interface color-scheme "prefer-dark"




dconf write /org/gnome/shell/extensions/user-theme/name "'Orchis-Dark'"

dconf write /org/gnome/shell/extensions/gtk3-theme-switcher/dark "'Orchis-Dark'"

dconf write /org/gnome/shell/extensions/gtk3-theme-switcher/light "'Orchis-Light'"

```




### xfce

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-style-select/style-select.sh#L349-L404)

``` sh

xfconf-query --channel "xfwm4" --property "/general/theme" --create --type "string" --set "Orchis-Dark"

xfconf-query --channel "xsettings" --property "/Net/ThemeName" --create --type "string" --set "Orchis-Dark"

xfconf-query --channel "xsettings" --property "/Net/IconThemeName" --create --type "string" --set "Citrus-red-dark"

xfconf-query --channel "xsettings" --property "/Gtk/CursorThemeName" --create --type "string" --set "breeze_cursors"

xfconf-query --channel "xsettings" --property "/Gtk/CursorThemeSize" --create --type "int" --set "24"

```




### mate

> 設定檔 / [Gruvbox](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-style-select/profiles/Gruvbox/config.sh)

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-style-select/style-select.sh#L292-L347)

``` sh

gsettings set org.mate.Marco.general theme "Orchis-Dark"

gsettings set org.mate.interface gtk-theme "Orchis-Dark"

gsettings set org.mate.interface icon-theme "Citrus-red-dark"

gsettings set org.mate.peripherals-mouse cursor-theme "breeze_cursors"

gsettings set org.mate.peripherals-mouse cursor-size "24"

```




### cinnamon

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-style-select/style-select.sh#L231-L290)

``` sh

gsettings set org.cinnamon.desktop.wm.preferences theme "Orchis-Dark"

gsettings set org.cinnamon.desktop.interface gtk-theme "Orchis-Dark"

gsettings set org.cinnamon.desktop.interface icon-theme "Citrus-red-dark"

gsettings set org.cinnamon.desktop.interface cursor-theme "breeze_cursors"

gsettings set org.cinnamon.desktop.interface cursor-size "24"

gsettings set org.cinnamon.theme name "Orchis-Dark"

```




## Link

| Link | GitHub |
| ---- | ------ |
| [make-xfce-style](https://samwhelp.github.io/make-xfce-style/) | [GitHub](https://github.com/samwhelp/make-xfce-style) |
| [make-gnome-shell-style](https://samwhelp.github.io/make-gnome-shell-style/) | [GitHub](https://github.com/samwhelp/make-gnome-shell-style) |
