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




menu_content () {

cat << EOF
Super
Alt
EOF

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

	echo "## Selected: ${selected}"

	
	local mouse_button_modifier="${selected}"

	echo "## Use Modifier: ${mouse_button_modifier}"

	mouse_button_modifier_ctrl_set "${mouse_button_modifier}"

}




mouse_button_modifier_ctrl_set () {

	local agent

	#agent="gnome"
	#agent="cinnamon"
	#agent="mate"
	#agent="xfce"

	agent="$(main_desktop_environment)"

	echo
	echo "##"
	echo "## main_desktop_environment: ${agent}"
	echo "##"
	echo

	local delegate="mouse_button_modifier_ctrl_set_for_${agent}"

	"${delegate}" "${@}"

}

mouse_button_modifier_ctrl_set_for_gnome () {


	##
	## /usr/share/glib-2.0/schemas/org.gnome.desktop.wm.preferences.gschema.xml
	##


	echo "## Config: mouse_button_modifier_ctrl_set_for_gnome_shell"

	local mouse_button_modifier="${1}"


	echo
	echo "##"
	echo "## mouse_button_modifier: ${mouse_button_modifier}"
	echo "##"
	echo


	echo
	echo "gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier \"<${mouse_button_modifier}>\""
	gsettings set org.gnome.desktop.wm.preferences mouse-button-modifier "<${mouse_button_modifier}>"


	echo
	echo "gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true"
	gsettings set org.gnome.desktop.wm.preferences resize-with-right-button true


	echo

	return 0
}

mouse_button_modifier_ctrl_set_for_cinnamon () {


	echo "## Config: mouse_button_modifier_ctrl_set_for_cinnamon"

	local mouse_button_modifier="${1}"


	echo
	echo "##"
	echo "## mouse_button_modifier: ${mouse_button_modifier}"
	echo "##"
	echo


	echo
	echo "gsettings set org.cinnamon.desktop.wm.preferences mouse-button-modifier \"<${mouse_button_modifier}>\""
	gsettings set org.cinnamon.desktop.wm.preferences mouse-button-modifier "<${mouse_button_modifier}>"


	echo
	echo "gsettings set org.cinnamon.desktop.wm.preferences resize-with-right-button true"
	gsettings set org.cinnamon.desktop.wm.preferences resize-with-right-button true


	echo
	echo "gsettings set org.cinnamon.desktop.wm.preferences mouse-button-zoom-modifier \"<${mouse_button_modifier}>\""
	gsettings set org.cinnamon.desktop.wm.preferences mouse-button-zoom-modifier "<${mouse_button_modifier}>"


	echo

	return 0
}

mouse_button_modifier_ctrl_set_for_mate () {


	echo "## Config: mouse_button_modifier_ctrl_set_for_mate"

	local mouse_button_modifier="${1}"


	echo
	echo "##"
	echo "## mouse_button_modifier: ${mouse_button_modifier}"
	echo "##"
	echo


	echo
	echo "gsettings set org.mate.Marco.general mouse-button-modifier \"<${mouse_button_modifier}>\""
	gsettings set org.mate.Marco.general mouse-button-modifier "<${mouse_button_modifier}>"


	echo
	echo "gsettings set org.mate.Marco.general resize-with-right-button true"
	gsettings set org.mate.Marco.general resize-with-right-button true


	echo

	return 0
}

mouse_button_modifier_ctrl_set_for_xfce () {

	echo "Config: mouse_button_modifier_ctrl_set_for_xfce"

	local mouse_button_modifier="${1}"


	echo
	echo "##"
	echo "## mouse_button_modifier: ${mouse_button_modifier}"
	echo "##"
	echo

	echo
	echo "xfconf-query --channel xfwm4 --property '/general/easy_click' --set '${mouse_button_modifier}' --type 'string' --create"
	xfconf-query --channel xfwm4 --property "/general/easy_click" --set "${mouse_button_modifier}" --type 'string' --create


	#echo
	#echo "sleep 5"
	#sleep 5

	echo
	echo "Please Check:"
	echo "grep 'easy_click' ${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml"
	#grep 'easy_click' "${HOME}/.config/xfce4/xfconf/xfce-perchannel-xml/xfwm4.xml"

	return 0

}




__main__ () {
	demo_applet
}

__main__
