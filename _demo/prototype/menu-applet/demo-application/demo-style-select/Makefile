
default: help
.PHONY: default

help:
	@echo 'Usage:'
	@echo '	$$ make [action]'
	@echo
	@echo 'Example:'
	@echo '	$$ make'
	@echo '	$$ make help'
	@echo
	@echo '	$$ make de-default'
	@echo
	@echo '	$$ make de-gnome'
	@echo '	$$ make de-xfce'
	@echo '	$$ make de-mate'
	@echo '	$$ make de-cinnamon'
	@echo
.PHONY: help




de-default:
	./style-select.sh
.PHONY: de-default




de-gnome:
	THE_MASTER_DE=gnome ./style-select.sh
.PHONY: de-gnome


de-xfce:
	THE_MASTER_DE=xfce ./style-select.sh
.PHONY: de-xfce


de-mate:
	THE_MASTER_DE=mate ./style-select.sh
.PHONY: de-mate


de-cinnamon:
	THE_MASTER_DE=cinnamon ./style-select.sh
.PHONY: de-cinnamon
