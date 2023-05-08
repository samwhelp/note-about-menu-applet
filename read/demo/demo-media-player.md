---
title: demo-media-player
nav_order: 8030
has_children: false
parent: 範例
---


# demo-media-player


## Project

* [demo-media-player](https://github.com/samwhelp/note-about-menu-applet/tree/gh-pages/_demo/prototype/menu-applet/demo-application/demo-media-player)


## 建構基礎

> 設定桌面圖片

| 環境 |
| --- |
| [mpv](#mpv) |
| [vlc](#vlc) |
| [smplayer](#smplayer) |
| [audacious](#audacious) |



### mpv

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-media-player/media-player.sh#L137-L158)

``` sh
mpv "${HOME}/Videos/demo.webm"
```


### vlc

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-media-player/media-player.sh#L160-L182)

``` sh
vlc "${HOME}/Videos/demo.webm"
```


### smplayer

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-media-player/media-player.sh#L184-L204)

``` sh
smplayer "${HOME}/Videos/demo.webm"
```


### audacious

> [實作程式碼片段](https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/prototype/menu-applet/demo-application/demo-media-player/media-player.sh#L206-L245)

``` sh
audacious "${HOME}/Videos/demo.webm"
```



