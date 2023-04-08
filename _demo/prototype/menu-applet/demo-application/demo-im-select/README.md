

# demo-im-select


## Link

* note-about-fedora / [fcitx5-chewing](https://samwhelp.github.io/note-about-fedora/read/im/fcitx5/fcitx5-chewing.html)
* Debian / $ man [im-config](https://manpages.debian.org/unstable/im-config/im-config.8.en.html)
* Ubuntu / $ man [im-config](https://manpages.ubuntu.com/manpages/focal/man8/im-config.8.html)
* Fedora / $ man [imsettings-switch](https://www.mankier.com/1/imsettings-switch)


## Wiki

* Debian Wiki / [ChineseInputMethod](https://wiki.debian.org/ChineseInputMethod)
* Debian Wiki / [InputMethodBuster](https://wiki.debian.org/InputMethodBuster)
* Fedora Wiki / I18N / [InputMethods](https://fedoraproject.org/wiki/I18N/InputMethods)


## Usage


### default

run

``` sh
./im-select.sh
```

or run

``` sh
THE_DEFAULT_MENU_FACTORY=fzf THE_DEFAULT_DISTRO=ubuntu ./im-select.sh
```

### alter

run

``` sh
THE_DEFAULT_MENU_FACTORY=rofi THE_DEFAULT_DISTRO=arch ./im-select.sh
```


## Usage / Distro

### ubuntu

run

``` sh
./im-select.sh
```

or run

``` sh
THE_DEFAULT_DISTRO=ubuntu ./im-select.sh
```


### arch

run

``` sh
THE_DEFAULT_DISTRO=arch ./im-select.sh
```


### fedora

run

``` sh
THE_DEFAULT_DISTRO=fedora ./im-select.sh
```


## Usage / Menu Factory


### fzf

run

``` sh
./im-select.sh
```

or run

``` sh
THE_DEFAULT_MENU_FACTORY=fzf ./im-select.sh
```

### dmenu

run

``` sh
THE_DEFAULT_MENU_FACTORY=dmenu ./im-select.sh
```

### rofi

run

``` sh
THE_DEFAULT_MENU_FACTORY=rofi ./im-select.sh
```

### jgmenu

run

``` sh
THE_DEFAULT_MENU_FACTORY=jgmenu ./im-select.sh
```
