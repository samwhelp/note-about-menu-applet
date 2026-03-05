#!/usr/bin/env bash


##
## https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
##

THE_MASTER_DE="${THE_MASTER_DE:=gnome}"

main_desktop_environment () {
	echo "${THE_MASTER_DE}"
}

THE_MASTER_MENU_FACTORY="${THE_MASTER_MENU_FACTORY:=fzf}"

main_menu_factory () {
	echo "${THE_MASTER_MENU_FACTORY}"
}




menu_content () {
	ls -1 ./profiles
}

menu_factory () {
	local agent

	#agent="fzf"
	#agent="dmenu"
	#agent="rofi"
	#agent="jgmenu"

	agent="$(main_menu_factory)"

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
	 menu_content | menu_factory
}

demo_applet () {

	local selected="$(menu_start)"
	
	if [ -z "${selected}" ]; then
		echo "## Not selected ##"
		
		return 0
	fi


	echo
	echo "##"
	echo "## ## Selected: ${selected}"
	echo "##"
	echo

	
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
	echo "## THE_PREFER_DARK_THEME: ${THE_PREFER_DARK_THEME}"
	echo "## THE_PREFER_DARK_THEME_NAME: ${THE_PREFER_DARK_THEME_NAME}"
	echo "## THE_PREFER_LIGHT_THEME_NAME: ${THE_PREFER_LIGHT_THEME_NAME}"
	echo "##"
	echo


	style_ctrl_set "${THE_WM_THEME_NAME}" "${THE_GTK_THEME_NAME}" "${THE_ICON_THEME_NAME}" "${THE_CURSOR_THEME_NAME}" "${THE_CURSOR_SIZE}" "${THE_PREFER_DARK_THEME}" "${THE_PREFER_DARK_THEME_NAME}" "${THE_PREFER_LIGHT_THEME_NAME}"

}




style_ctrl_set () {

	local agent

	#agent="gnome"
	#agent="cinnamon"
	#agent="mate"
	#agent="xfce"

	agent="$(main_desktop_environment)"

	echo
	echo "##"
	echo "## ## main_desktop_environment: ${agent}"
	echo "##"
	echo

	local delegate="style_ctrl_set_for_${agent}"

	"${delegate}" "${@}"

}

style_ctrl_set_for_gnome () {

	echo
	echo "##"
	echo "## ## Config: style_ctrl_set_for_gnome"
	echo "##"
	echo

	local wm_theme="${1}"
	local gtk_theme="${2}"
	local icon_theme="${3}"
	local cursor_theme="${4}"
	local cursor_size="${5}"
	local prefer_dark_theme="${6}"
	local prefer_dark_theme_name="${7}"
	local prefer_light_theme_name="${8}"

	local color_scheme="default"

	if [ "${prefer_dark_theme}" = "true" ]; then
		color_scheme="prefer-dark"
	fi

	echo
	echo "##"
	echo "## wm_theme: ${wm_theme}"
	echo "## gtk_theme: ${gtk_theme}"
	echo "## icon_theme: ${icon_theme}"
	echo "## cursor_theme: ${cursor_theme}"
	echo "## cursor_size: ${cursor_size}"
	echo "## prefer_dark_theme: ${prefer_dark_theme}"
	echo "## prefer_dark_theme_name: ${prefer_dark_theme_name}"
	echo "## prefer_light_theme_name: ${prefer_light_theme_name}"
	echo "##"
	echo


	echo
	echo "gsettings set org.gnome.desktop.wm.preferences theme \"${wm_theme}\""
	gsettings set org.gnome.desktop.wm.preferences theme "${wm_theme}"

	echo
	echo "gsettings set org.gnome.desktop.interface gtk-theme \"${gtk_theme}\""
	gsettings set org.gnome.desktop.interface gtk-theme "${gtk_theme}"

	echo
	echo "gsettings set org.gnome.desktop.interface icon-theme \"${icon_theme}\""
	gsettings set org.gnome.desktop.interface icon-theme "${icon_theme}"

	echo
	echo "gsettings set org.gnome.desktop.interface cursor-theme \"${cursor_theme}\""
	gsettings set org.gnome.desktop.interface cursor-theme "${cursor_theme}"

	echo
	echo "gsettings set org.gnome.desktop.interface cursor-size \"${cursor_size}\""
	gsettings set org.gnome.desktop.interface cursor-size "${cursor_size}"

	echo
	echo "gsettings set org.gnome.desktop.interface color-scheme \"${color_scheme}\""
	gsettings set org.gnome.desktop.interface color-scheme "${color_scheme}"

	echo
	echo "dconf write /org/gnome/shell/extensions/user-theme/name \"'${gtk_theme}'\""
	dconf write /org/gnome/shell/extensions/user-theme/name "'${gtk_theme}'"

	echo
	echo "dconf write /org/gnome/shell/extensions/gtk3-theme-switcher/dark \"'${prefer_dark_theme_name}'\""
	dconf write /org/gnome/shell/extensions/gtk3-theme-switcher/dark "'${prefer_dark_theme_name}'"

	echo
	echo "dconf write /org/gnome/shell/extensions/gtk3-theme-switcher/light \"'${prefer_light_theme_name}'\""
	dconf write /org/gnome/shell/extensions/gtk3-theme-switcher/light "'${prefer_light_theme_name}'"


	#gsettings set org.gnome.shell.extensions.gtk3-theme-switcher dark "${prefer_dark_theme_name}"
	#gsettings set org.gnome.shell.extensions.gtk3-theme-switcher light "${prefer_light_theme_name}"
	#gsettings set org.gnome.shell.extensions.user-theme name "${gtk_theme}"


	echo

	return 0
}

style_ctrl_set_for_cinnamon () {

	echo "TODO: style_ctrl_set_for_cinnamon"

	return 0
}

style_ctrl_set_for_mate () {

	echo
	echo "##"
	echo "## ## Config: style_ctrl_set_for_mate"
	echo "##"
	echo

	local wm_theme="${1}"
	local gtk_theme="${2}"
	local icon_theme="${3}"
	local cursor_theme="${4}"
	local cursor_size="${5}"
	local prefer_dark_theme="${6}"
	local prefer_dark_theme_name="${7}"
	local prefer_light_theme_name="${8}"

	echo
	echo "##"
	echo "## wm_theme: ${wm_theme}"
	echo "## gtk_theme: ${gtk_theme}"
	echo "## icon_theme: ${icon_theme}"
	echo "## cursor_theme: ${cursor_theme}"
	echo "## cursor_size: ${cursor_size}"
	echo "## prefer_dark_theme: ${prefer_dark_theme}"
	echo "## prefer_dark_theme_name: ${prefer_dark_theme_name}"
	echo "## prefer_light_theme_name: ${prefer_light_theme_name}"
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

	echo
	echo "##"
	echo "## ## Config: style_ctrl_set_for_xfce"
	echo "##"
	echo

	local wm_theme="${1}"
	local gtk_theme="${2}"
	local icon_theme="${3}"
	local cursor_theme="${4}"
	local cursor_size="${5}"
	local prefer_dark_theme="${6}"
	local prefer_dark_theme_name="${7}"
	local prefer_light_theme_name="${8}"

	echo
	echo "##"
	echo "## wm_theme: ${wm_theme}"
	echo "## gtk_theme: ${gtk_theme}"
	echo "## icon_theme: ${icon_theme}"
	echo "## cursor_theme: ${cursor_theme}"
	echo "## cursor_size: ${cursor_size}"
	echo "## prefer_dark_theme: ${prefer_dark_theme}"
	echo "## prefer_dark_theme_name: ${prefer_dark_theme_name}"
	echo "## prefer_light_theme_name: ${prefer_light_theme_name}"
	echo "##"
	echo


	echo
	echo "xfconf-query --channel \"xfwm4\" --property \"/general/theme\" --create --type \"string\" --set \"${wm_theme}\""
	xfconf-query --channel "xfwm4" --property "/general/theme" --create --type "string" --set "${wm_theme}"

	echo
	echo "xfconf-query --channel \"xsettings\" --property \"/Net/ThemeName\" --create --type \"string\" --set \"${gtk_theme}\""
	xfconf-query --channel "xsettings" --property "/Net/ThemeName" --create --type "string" --set "${gtk_theme}"

	echo
	echo "xfconf-query --channel \"xsettings\" --property \"/Net/IconThemeName\" --create --type \"string\" --set \"${icon_theme}\""
	xfconf-query --channel "xsettings" --property "/Net/IconThemeName" --create --type "string" --set "${icon_theme}"

	echo
	echo "xfconf-query --channel \"xsettings\" --property \"/Gtk/CursorThemeName\" --create --type \"string\" --set \"${cursor_theme}\""
	xfconf-query --channel "xsettings" --property "/Gtk/CursorThemeName" --create --type "string" --set "${cursor_theme}"

	echo
	echo "xfconf-query --channel \"xsettings\" --property \"/Gtk/CursorThemeSize\" --create --type \"int\" --set \"${cursor_size}\""
	xfconf-query --channel "xsettings" --property "/Gtk/CursorThemeSize" --create --type "int" --set "${cursor_size}"


	echo

	return 0
}




__main__ () {
	demo_applet
}

__main__
