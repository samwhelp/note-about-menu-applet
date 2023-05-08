#!/usr/bin/env bash


##
## https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
##


THE_DEFAULT_MENU_FACTORY="${THE_DEFAULT_MENU_FACTORY:=fzf}"

main_menu_factory () {
	echo "${THE_DEFAULT_MENU_FACTORY}"
}


THE_DEFAULT_TEMPLATE_DIR_PATH="${THE_DEFAULT_TEMPLATE_DIR_PATH:=$HOME/Templates}"

main_template_dir_path () {
	echo "${THE_DEFAULT_TEMPLATE_DIR_PATH}"
}


menu_content () {

	menu_content_by_ls

}

menu_content_by_ls () {

	local template_dir_path="$(main_template_dir_path)"

	#ls -1 "${template_dir_path}"/*

	ls -1 "${template_dir_path}"/* 2>/dev/null

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


	local template_file_path="${selected}"

	if ! [ -f "${template_file_path}" ]; then
		echo "## Template File Not Exist: ${template_file_path}"

		return 0
	fi


	echo "## Use Template: ${template_file_path}"

	template_ctrl_set "${template_file_path}"

}




template_ctrl_set () {

	local template_file_path="${1}"

	local target_dir_path="$(pwd)"

	#echo "${template_file_path}"
	#echo "${target_dir_path}"

	echo "cp -f ${template_file_path} ${target_dir_path}/"
	cp -f "${template_file_path}" "${target_dir_path}/"

}


__main__ () {
	demo_applet
}

__main__
