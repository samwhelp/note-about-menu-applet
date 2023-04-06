#!/usr/bin/env bash


##
## https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
##

THE_DEFAULT_DE="${THE_DEFAULT_DE:=mate}"

main_desktop_environment () {
	echo "${THE_DEFAULT_DE}"
}

menu_list () {

	#ls -1 /usr/share/backgrounds/*.{png,jpg,jpeg}

	ls -1 /usr/share/backgrounds/*.{png,jpg,jpeg} 2>/dev/null

}

menu_factory () {
	rofi -dmenu
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

	
	local wallpaper_file_path="${selected}"
	
	if ! [ -f "${wallpaper_file_path}" ]; then
		echo "## Wallpaper File Not Exist: ${wallpaper_file_path}"
		
		return 0
	fi	
	

	echo "## Use Wallpaper: ${wallpaper_file_path}"

	wallpaper_ctrl_set "${wallpaper_file_path}"

}


wallpaper_ctrl_set () {

	local agent

	#agent="feh"
	#agent="gnome"
	#agent="cinnamon"
	#agent="mate"
	#agent="xfce"

	agent=$(main_desktop_environment)

	local delegate="wallpaper_ctrl_set_for_${agent}"

	"${delegate}" "${1}"

}

wallpaper_ctrl_set_for_feh () {

	##
	## https://wiki.archlinux.org/title/feh
	##

	local wallpaper_file_path="${1}"

	echo
	echo "feh --bg-scale \"${wallpaper_file_path}\""
	feh --bg-scale "${wallpaper_file_path}"


	echo

	return 0
}



wallpaper_ctrl_set_for_gnome () {

	echo "TODO: wallpaper_ctrl_set_for_gnome"

	return 0
}

wallpaper_ctrl_set_for_cinnamon () {

	echo "TODO: wallpaper_ctrl_set_for_cinnamon"

	return 0
}

wallpaper_ctrl_set_for_mate () {

	echo
	echo "## Config: wallpaper_ctrl_set_for_mate"
	echo

	local wallpaper_file_path="${1}"

	echo
	echo "gsettings set org.mate.background picture-filename \"${wallpaper_file_path}\""
	gsettings set org.mate.background picture-filename "${wallpaper_file_path}"

	echo
	echo "gsettings set org.mate.background picture-options \"zoom\""
	gsettings set org.mate.background picture-options "zoom"


	echo

	return 0
}

wallpaper_ctrl_set_for_xfce () {

	echo "TODO: wallpaper_ctrl_set_for_xfce"

	return 0
}



__main__ () {
	demo_applet
}

__main__
