#!/usr/bin/env bash


##
## https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
##

THE_DEFAULT_DISTRO="${THE_DEFAULT_DISTRO:=ubuntu}"

main_distro () {
	echo "${THE_DEFAULT_DISTRO}"
}

menu_content () {

cat << EOF
fcitx
fcitx5
ibus
gcin
hime


EOF

}

menu_factory () {
	rofi -dmenu
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

	
	local input_method_framework="${selected}"

	echo "## Use IM: ${input_method_framework}"

	im_ctrl_set "${input_method_framework}"

}


im_ctrl_set () {

	local agent

	#agent="ubuntu"
	#agent="arch"

	agent="$(main_distro)"

	local delegate="im_ctrl_set_for_${agent}"

	"${delegate}" "${1}"

}

im_ctrl_set_for_ubuntu () {

	echo
	echo "## Config: im_ctrl_set_for_ubuntu"
	echo

	##
	## https://wiki.archlinux.org/title/feh
	##

	local input_method_framework="${1}"

	echo
	echo "im-config -n \"${input_method_framework}\""
	im-config -n "${input_method_framework}"


	echo
	echo "cat \"${HOME}/.xinputrc\""
	echo
	cat "${HOME}/.xinputrc"

	echo

	return 0
}



im_ctrl_set_for_arch () {

	echo
	echo "## TODO: im_ctrl_set_for_arch"
	echo

	local input_method_framework="${1}"

	echo
	echo "## input_method_framework: ${input_method_framework}"


	echo

	return 0
}


__main__ () {
	demo_applet
}

__main__
