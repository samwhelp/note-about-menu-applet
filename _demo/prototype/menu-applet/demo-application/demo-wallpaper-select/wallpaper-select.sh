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

#THE_DEFAULT_IMAGE_DIR_PATH="${THE_DEFAULT_IMAGE_DIR_PATH:=$HOME/Pictures}"
THE_DEFAULT_IMAGE_DIR_PATH="${THE_DEFAULT_IMAGE_DIR_PATH:=/usr/share/backgrounds}"

main_image_dir_path () {
	echo "${THE_DEFAULT_IMAGE_DIR_PATH}"
}

menu_content () {

	#menu_content_by_ls

	menu_content_by_find

}

menu_content_by_ls () {

	local image_dir_path="$(main_image_dir_path)"

	#ls -1 "${image_dir_path}"/*.{png,jpg,jpeg}

	ls -1 "${image_dir_path}"/*.{png,jpg,jpeg} 2>/dev/null

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
		grep -F 'image/' |
		cut -d ':' -f 1

}

menu_content_by_find_002 () {

	##
	## https://github.com/samwhelp/note-about-menu-applet/blob/gh-pages/_demo/sample/find-image-file/demo-0031.sh
	##

	local image_dir_path="$(main_image_dir_path)"

	find "${image_dir_path}" \( -iname "*.jpg" -or -iname "*.jpeg" -or -iname "*.png" -or -iname "*.tif" -or -iname "*.bmp" -or -iname "*.gif" -or -iname "*.xpm" -or -iname "*.nef" -or -iname "*.cr2" -or -iname "*.arw" \)

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

	echo
	echo "## Config: wallpaper_ctrl_set_for_xfce"
	echo

	local wallpaper_file_path="${1}"
	local bg_option=5
	local screen=`xrandr --listactivemonitors | awk -F ' ' 'END {print $1}' | tr -d \:`
	local monitor=`xrandr --listactivemonitors | awk -F ' ' 'END {print $2}' | tr -d \*+`


	echo
	echo "xfconf-query --channel xfce4-desktop --property /backdrop/screen${screen}/monitor${monitor}/workspace0/last-image --set ${wallpaper_file_path} --type 'string' --create"
	xfconf-query --channel xfce4-desktop --property "/backdrop/screen${screen}/monitor${monitor}/workspace0/last-image" --set "${wallpaper_file_path}" --type 'string' --create

	echo
	echo "xfconf-query --channel xfce4-desktop --property /backdrop/screen${screen}/monitor${monitor}/workspace0/image-style --set $bg_option --type 'int' --create"
	xfconf-query --channel xfce4-desktop --property "/backdrop/screen${screen}/monitor${monitor}/workspace0/image-style" --set "$bg_option" --type 'int' --create

	echo
	echo "xfconf-query --channel xfce4-desktop --property /backdrop/single-workspace-mode --set 'true' --type 'bool' --create"
	xfconf-query --channel xfce4-desktop --property "/backdrop/single-workspace-mode" --set 'true' --type 'bool' --create


	##
	## ## image-style
	## 0: None
	## 1: Centered
	## 2: Tiled
	## 3: Stretched
	## 4: Scaled
	## 5: Zoomed
	##
	## > None for Color
	##


	return 0
}

wallpaper_ctrl_set_for_pcmanfm () {

	echo
	echo "## Config: wallpaper_ctrl_set_for_pcmanfm"
	echo


	##
	## pcmanfm --desktop &
	##


	local wallpaper_file_path="${1}"

	echo
	echo "pcmanfm --set-wallpaper \"${wallpaper_file_path}\""
	pcmanfm --set-wallpaper "${wallpaper_file_path}"


	echo
	echo "pcmanfm --wallpaper-mode \"fit\""
	pcmanfm --wallpaper-mode "fit"


	echo

	return 0
}

wallpaper_ctrl_set_for_pcmanfm-qt () {

	echo
	echo "## Config: wallpaper_ctrl_set_for_pcmanfm-qt"
	echo


	##
	## pcmanfm-qt --desktop &
	##


	local wallpaper_file_path="${1}"

	echo
	echo "pcmanfm-qt --set-wallpaper \"${wallpaper_file_path}\""
	pcmanfm-qt --set-wallpaper "${wallpaper_file_path}"


	echo
	echo "pcmanfm-qt --wallpaper-mode \"fit\""
	pcmanfm-qt --wallpaper-mode "fit"


	echo

	return 0
}



__main__ () {
	demo_applet
}

__main__
