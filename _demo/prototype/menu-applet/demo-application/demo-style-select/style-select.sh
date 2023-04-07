#!/usr/bin/env bash


##
## https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
##

THE_DEFAULT_DE="${THE_DEFAULT_DE:=mate}"

main_desktop_environment () {
	echo "${THE_DEFAULT_DE}"
}

THE_DEFAULT_MENU_FACTORY="${THE_DEFAULT_MENU_FACTORY:=fzf}"

main_menu_factory () {
	echo "${THE_DEFAULT_MENU_FACTORY}"
}




menu_list () {
	ls -1 ./profiles
}

menu_factory () {
	local agent

	#agent="fzf"
	#agent="dmenu"
	#agent="rofi"
	#agent="jgmenu"

	agent=$(main_menu_factory)

	local delegate="menu_factory_by_${agent}"

	"${delegate}"
}

menu_factory_by_fzf () {
	fzf
}

menu_factory_by_dmenu () {
	dmenu -b -l 10
}

menu_factory_by_rofi () {
	rofi -dmenu
}

menu_factory_by_jgmenu () {
	jgmenu --simple --center --no-spawn
}

menu_start () {
	 menu_list | menu_factory
}

demo_applet () {

	local selected=$(menu_start)
	
	if [ -z "${selected}" ]; then
		echo "## Not selected ##"
		
		return 0
	fi

	echo "## Selected: ${selected}"

	
	local source_file_path="./profiles/${selected}/config.sh"
	
	if ! [ -f "${source_file_path}" ]; then
		echo "## Source File Not Exist: ${source_file_path}"
		
		return 0
	fi	
	
	source "${source_file_path}"
	
	echo
	echo "##"
	echo "## THE_WM_THEME_NAME: ${THE_WM_THEME_NAME}"
	echo "## THE_GTK_THEME_NAME: ${THE_GTK_THEME_NAME}"
	echo "## THE_ICON_THEME_NAME: ${THE_ICON_THEME_NAME}"
	echo "## THE_CURSOR_THEME_NAME: ${THE_CURSOR_THEME_NAME}"
	echo "## THE_CURSOR_SIZE: ${THE_CURSOR_SIZE}"
	echo "## THE_GHOME_SHELL_THEME_NAME: ${THE_GHOME_SHELL_THEME_NAME}"
	echo "##"
	echo


	style_ctrl_set ${THE_WM_THEME_NAME}" ${THE_GTK_THEME_NAME}" ${THE_ICON_THEME_NAME}" ${THE_CURSOR_THEME_NAME}" ${THE_CURSOR_SIZE}" ${THE_GHOME_SHELL_THEME_NAME}"

}




style_ctrl_set () {

	local agent

	#agent="gnome"
	#agent="cinnamon"
	#agent="mate"
	#agent="xfce"

	agent=$(main_desktop_environment)

	echo
	echo "##"
	echo "## main_desktop_environment: ${agent}"
	echo "##"
	echo

	local delegate="style_ctrl_set_for_${agent}"

	"${delegate}" $@

}

style_ctrl_set_for_gnome () {

	echo "TODO: style_ctrl_set_for_gnome"

	return 0
}

style_ctrl_set_for_cinnamon () {

	echo "TODO: style_ctrl_set_for_cinnamon"

	return 0
}

style_ctrl_set_for_mate () {

	echo "## Config: style_ctrl_set_for_mate"

	local wm_theme="${1}"
	local gtk_theme="${2}"
	local icon_theme="${3}"
	local cursor_theme="${4}"
	local cursor_size="${5}"
	local gnome_shell_theme="${6}"

	echo
	echo "##"
	echo "## wm_theme: ${wm_theme}"
	echo "## gtk_theme: ${gtk_theme}"
	echo "## icon_theme: ${icon_theme}"
	echo "## cursor_theme: ${cursor_theme}"
	echo "## cursor_size: ${cursor_size}"
	echo "## gnome_shell_theme: ${gnome_shell_theme}"
	echo "##"
	echo


	echo
	echo "gsettings set org.mate.Marco.general theme \"${wm_theme}\""
	gsettings set org.mate.Marco.general theme "${wm_theme}"

	echo
	echo "gsettings set org.mate.interface gtk-theme \"${gtk_theme}\""
	gsettings set org.mate.interface gtk-theme "${gtk_theme}"

	echo
	echo "gsettings set org.mate.interface icon-theme \"${icon_theme}\""
	gsettings set org.mate.interface icon-theme "${icon_theme}"

	echo
	echo "gsettings set org.mate.peripherals-mouse cursor-theme \"${cursor_theme}\""
	gsettings set org.mate.peripherals-mouse cursor-theme "${cursor_theme}"

	echo
	echo "gsettings set org.mate.peripherals-mouse cursor-size \"${cursor_size}\""
	gsettings set org.mate.peripherals-mouse cursor-size "${cursor_size}"


	echo

	return 0
}

style_ctrl_set_for_xfce () {

	echo "TODO: style_ctrl_set_for_xfce"

	return 0
}




__main__ () {
	demo_applet
}

__main__
