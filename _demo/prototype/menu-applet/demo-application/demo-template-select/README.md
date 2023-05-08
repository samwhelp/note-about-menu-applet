

# demo-template-select


## Usage


### default

run

``` sh
./template-select.sh
```

or run

``` sh
THE_DEFAULT_MENU_FACTORY=fzf THE_DEFAULT_TEMPLATE_DIR_PATH="$HOME/Templates" ./template-select.sh
```

### alter

run

``` sh
THE_DEFAULT_MENU_FACTORY=rofi THE_DEFAULT_TEMPLATE_DIR_PATH="$HOME/scripts" ./template-select.sh
```




## Usage / Menu Factory


### fzf

run

``` sh
./template-select.sh
```

or run

``` sh
THE_DEFAULT_MENU_FACTORY=fzf ./template-select.sh
```

### dmenu

run

``` sh
THE_DEFAULT_MENU_FACTORY=dmenu ./template-select.sh
```

### rofi

run

``` sh
THE_DEFAULT_MENU_FACTORY=rofi ./template-select.sh
```

### jgmenu

run

``` sh
THE_DEFAULT_MENU_FACTORY=jgmenu ./template-select.sh
```
