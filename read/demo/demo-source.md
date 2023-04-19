---
title: demo-source
nav_order: 8010
has_children: false
parent: 範例
---


# demo-source


## Project

* [demo-source](https://github.com/samwhelp/note-about-menu-applet/tree/gh-pages/_demo/prototype/menu-applet/demo-application/demo-source)


## 建構基礎

* $ man [bash](https://manpages.ubuntu.com/manpages/jammy/en/man1/bash.1.html)
* $ man [dash](https://manpages.ubuntu.com/manpages/jammy/en/man1/dash.1.html)
* $ man [sh](https://manpages.ubuntu.com/manpages/jammy/en/man1/sh.1.html)


``` sh
source profiles/aaa/config.sh

source profiles/bbb/config.sh

source profiles/ccc/config.sh
```


## bash / help

執行

``` sh
help source
```

顯示

```
source: source filename [arguments]
    Execute commands from a file in the current shell.

    Read and execute commands from FILENAME in the current shell.  The
    entries in $PATH are used to find the directory containing FILENAME.
    If any ARGUMENTS are supplied, they become the positional parameters
    when FILENAME is executed.

    Exit Status:
    Returns the status of the last command executed in FILENAME; fails if
    FILENAME cannot be read.
```


執行

``` sh
help .
```

顯示

```
.: . filename [arguments]
    Execute commands from a file in the current shell.

    Read and execute commands from FILENAME in the current shell.  The
    entries in $PATH are used to find the directory containing FILENAME.
    If any ARGUMENTS are supplied, they become the positional parameters
    when FILENAME is executed.

    Exit Status:
    Returns the status of the last command executed in FILENAME; fails if
    FILENAME cannot be read.
```
