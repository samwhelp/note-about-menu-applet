---
title: demo-im-select
nav_order: 8040
has_children: false
parent: 範例
---


# demo-im-select


## Project

* [demo-im-select](https://github.com/samwhelp/note-about-menu-applet/tree/gh-pages/_demo/prototype/menu-applet/demo-application/demo-im-select)


## 建構基礎

> 設定採用輸入法框架

| 環境 |
| --- |
| [Ubuntu](#ubuntu) |
| [Fedora](#fedora) |


### Ubuntu

* Ubuntu 探索筆記 / [中文輸入法](https://samwhelp.github.io/note-about-ubuntu/read/subject/im.html)

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-im-select/im-select.sh#L109-L131)

``` sh
im-config -n "fcitx"

im-config -n "fcitx5"

im-config -n "ibus"

im-config -n "gcin"

im-config -n "hime"
```


### Fedora

* Fedora 探索筆記 / [中文輸入法](https://samwhelp.github.io/note-about-fedora/read/im.html)

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-im-select/im-select.sh#L150-L172)

``` sh
imsettings-switch "fcitx"

imsettings-switch "fcitx5"

imsettings-switch "ibus"

imsettings-switch "gcin"

imsettings-switch "hime"
```


