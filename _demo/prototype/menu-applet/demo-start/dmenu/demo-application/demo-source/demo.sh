#!/usr/bin/env bash


menu_content () {
	ls -1 ./profiles
}

menu_factory () {
	dmenu -b -l 10
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

	
	local source_file_path="./profiles/${selected}/config.sh"
	
	if ! [ -f "${source_file_path}" ]; then
		echo "## Source File Not Exist: ${source_file_path}"
		
		return 0
	fi	
	
	source "${source_file_path}"
	
	echo "Theme: ${THE_THEME_NAME}"

}


__main__ () {
	demo_applet
}

__main__
