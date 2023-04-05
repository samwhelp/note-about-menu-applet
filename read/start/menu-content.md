---
title: Menu Content
nav_order: 2000
has_children: false
parent: 入門
---


# Menu Content


## Example Content

用來產生「Menu」的「範例內容」如下

```
aaa
bbb
ccc

```


## created by echo

執行下面指令

``` sh
echo -e "aaa\nbbb\nccc"
```

* man [echo](https://man.archlinux.org/man/echo.1)


## created by printf

執行下面指令

``` sh
printf "aaa\nbbb\nccc"
```

* man [printf](https://man.archlinux.org/man/printf.1)


## created by cat

執行下面指令

``` sh
cat << EOF
aaa
bbb
ccc

EOF
```

* man [cat](https://man.archlinux.org/man/cat.1)


## created by cat file

執行下面指令，產生「menu-content.txt」這個檔案

``` sh
cat > menu-content.txt << EOF
aaa
bbb
ccc

EOF
```

執行下面指令，讀取「menu-content.txt」的內容，顯示在「stdout」。

``` sh
cat menu-content.txt
```

* man [cat](https://man.archlinux.org/man/cat.1)
