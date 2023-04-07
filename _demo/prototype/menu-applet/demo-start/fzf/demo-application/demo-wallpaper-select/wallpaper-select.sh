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
	fzf
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

	agent="$(main_desktop_environment)"

	local delegate="wallpaper_ctrl_set_for_${agent}"

	"${delegate}" "${1}"

}

wallpaper_ctrl_set_for_feh () {

	echo
	echo "## Config: wallpaper_ctrl_set_for_feh"
	echo

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

	echo
	echo "## Config: wallpaper_ctrl_set_for_gnome"
	echo

	local wallpaper_file_path="file://${1}"

	echo
	echo "gsettings set org.gnome.desktop.background picture-uri \"${wallpaper_file_path}\""
	gsettings set org.gnome.desktop.background picture-uri "${wallpaper_file_path}"

	echo
	echo "gsettings set org.gnome.desktop.background picture-uri-dark \"${wallpaper_file_path}\""
	gsettings set org.gnome.desktop.background picture-uri-dark "${wallpaper_file_path}"

	echo
	echo "gsettings set org.gnome.desktop.screensaver picture-uri \"${wallpaper_file_path}\""
	gsettings set org.gnome.desktop.screensaver picture-uri "${wallpaper_file_path}"

	return 0
}

wallpaper_ctrl_set_for_cinnamon () {

	echo
	echo "## Config: wallpaper_ctrl_set_for_cinnamon"
	echo

	local wallpaper_file_path="file://${1}"


	echo
	echo "gsettings set org.cinnamon.desktop.background picture-uri \"${wallpaper_file_path}\""
	gsettings set org.cinnamon.desktop.background picture-uri "${wallpaper_file_path}"


	echo
	echo "gsettings set org.cinnamon.desktop.background picture-options \"zoom\""
	gsettings set org.cinnamon.desktop.background picture-options "zoom"


	echo

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
