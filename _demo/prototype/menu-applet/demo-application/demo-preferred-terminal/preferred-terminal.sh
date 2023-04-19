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
sakura
xfce4-terminal
mate-terminal
gnome-terminal
lxterminal

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

	
	local preferred_terminal="${selected}"

	echo "## Use Terminal: ${preferred_terminal}"

	preferred_terminal_ctrl_set "${preferred_terminal}"

}




preferred_terminal_ctrl_set () {

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

	local delegate="preferred_terminal_ctrl_set_for_${agent}"

	"${delegate}" "${@}"

}

preferred_terminal_ctrl_set_for_gnome () {


	##
	## https://samwhelp.github.io/note-about-terminal/read/terminal/sakura/config-preferred-applications/gnome-shell.html
	##

	echo "## Config: preferred_terminal_ctrl_set_for_gnome_shell"

	local preferred_terminal="${1}"


	echo
	echo "##"
	echo "## preferred_terminal: ${preferred_terminal}"
	echo "##"
	echo


	echo
	echo "gsettings set org.gnome.desktop.default-applications.terminal exec \"${preferred_terminal}\""
	gsettings set org.gnome.desktop.default-applications.terminal exec "${preferred_terminal}"


	echo

	return 0
}

preferred_terminal_ctrl_set_for_cinnamon () {


	##
	## https://samwhelp.github.io/note-about-terminal/read/terminal/sakura/config-preferred-applications/cinnamon.html
	##

	echo "## Config: preferred_terminal_ctrl_set_for_cinnamon"

	local preferred_terminal="${1}"


	echo
	echo "##"
	echo "## preferred_terminal: ${preferred_terminal}"
	echo "##"
	echo


	echo
	echo "gsettings set org.cinnamon.desktop.default-applications.terminal exec \"${preferred_terminal}\""
	gsettings set org.cinnamon.desktop.default-applications.terminal exec "${preferred_terminal}"


	echo

	return 0
}

preferred_terminal_ctrl_set_for_mate () {


	##
	## https://samwhelp.github.io/note-about-terminal/read/terminal/sakura/config-preferred-applications/mate.html
	##

	echo "## Config: preferred_terminal_ctrl_set_for_mate"

	local preferred_terminal="${1}"


	echo
	echo "##"
	echo "## preferred_terminal: ${preferred_terminal}"
	echo "##"
	echo


	echo
	echo "gsettings set org.mate.applications-terminal exec \"${preferred_terminal}\""
	gsettings set org.mate.applications-terminal exec "${preferred_terminal}"


	echo

	return 0
}

preferred_terminal_ctrl_set_for_xfce () {

	echo "TODO: preferred_terminal_ctrl_set_for_xfce"

	return 0
}




__main__ () {
	demo_applet
}

__main__
