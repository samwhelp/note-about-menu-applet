#!/usr/bin/env bash


##
## https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html
##


THE_DEFAULT_PLAYER="${THE_DEFAULT_PLAYER:=mpv}"

main_media_player () {
	echo "${THE_DEFAULT_PLAYER}"
}


THE_DEFAULT_MENU_FACTORY="${THE_DEFAULT_MENU_FACTORY:=fzf}"

main_menu_factory () {
	echo "${THE_DEFAULT_MENU_FACTORY}"
}


THE_DEFAULT_MEDIA_DIR_PATH="${THE_DEFAULT_MEDIA_DIR_PATH:=$HOME/Videos}"

main_image_dir_path () {
	echo "${THE_DEFAULT_MEDIA_DIR_PATH}"
}

menu_content () {

	#menu_content_by_ls

	menu_content_by_find

}

menu_content_by_ls () {

	local image_dir_path="$(main_image_dir_path)"

	#ls -1 "${image_dir_path}"/*.{mp4,mp3,mov,webm}

	ls -1 "${image_dir_path}"/*.{mp4,mp3,mov,webm} 2>/dev/null

}

menu_content_by_find () {

	##
	## https://stackoverflow.com/questions/16758105/list-all-graphic-image-files-with-find
	##

	menu_content_by_find_001

	#menu_content_by_find_002

}

menu_content_by_find_001 () {

	##
	## https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/sample/find-image-file/demo-0022.sh
	##

	local image_dir_path="$(main_image_dir_path)"

	find "${image_dir_path}" -type f -print0 |
		xargs -0 file --mime-type |
		grep -F 'video/' |
		cut -d ':' -f 1

}

menu_content_by_find_002 () {

	##
	## https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/sample/find-image-file/demo-0031.sh
	##

	local image_dir_path="$(main_image_dir_path)"

	find "${image_dir_path}" \( -iname "*.mp4" -or -iname "*.mp3" -or -iname "*.mov" -or -iname "*.webm" \)

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

	
	local media_file_path="${selected}"
	
	if ! [ -f "${media_file_path}" ]; then
		echo "## Media File Not Exist: ${media_file_path}"
		
		return 0
	fi	
	

	echo "## Use Media: ${media_file_path}"

	player_ctrl_play "${media_file_path}"

}




player_ctrl_play () {

	local agent

	#agent="mpv"
	#agent="vlc"
	#agent="smplayer"
	#agent="audacious"


	agent="$(main_media_player)"

	local delegate="player_ctrl_play_by_${agent}"

	"${delegate}" "${1}"

}

player_ctrl_play_by_mpv () {

	echo
	echo "## Config: player_ctrl_play_by_mpv"
	echo

	##
	## https://wiki.archlinux.org/title/mpv
	##

	local media_file_path="${1}"

	echo
	echo "mpv \"${media_file_path}\""
	mpv "${media_file_path}"


	echo

	return 0
}

player_ctrl_play_by_vlc () {

	echo
	echo "## Config: player_ctrl_play_by_vlc"
	echo

	#local media_file_path="file://${1}"


	local media_file_path="${1}"

	echo
	echo "vlc \"${media_file_path}\""
	vlc "${media_file_path}"


	echo

	return 0

}

player_ctrl_play_by_smplayer () {

	echo
	echo "## Config: player_ctrl_play_by_smplayer"
	echo

	local media_file_path="${1}"

	echo
	echo "smplayer \"${media_file_path}\""
	smplayer "${media_file_path}"


	echo

	return 0
}

player_ctrl_play_by_audacious () {

	echo
	echo "## Config: player_ctrl_play_by_audacious"
	echo

	local media_file_path="${1}"

	echo
	echo "audacious \"${media_file_path}\""
	audacious "${media_file_path}"


	echo

	return 0
}




__main__ () {
	demo_applet
}

__main__
