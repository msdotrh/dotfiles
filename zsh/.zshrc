edit-in-kitty='kitten edit-in-kitty'
run-help=man
which-command=whence
COLORTERM=truecolor
DBUS_SESSION_BUS_ADDRESS='unix:path=/run/user/1000/bus'
DEBUGINFOD_URLS='https://debuginfod.archlinux.org '
DESKTOP_SESSION=/usr/share/wayland-sessions/hyprland.desktop
DISPLAY=:0
EDITOR=nvim
HL_INITIAL_WORKSPACE_TOKEN=71251861-0948-4193-9bf7-f533f5f26f2f
HOME=/home/dongfengpo
HYPRCURSOR_SIZE=24
HYPRLAND_CMD='Hyprland --watchdog-fd 4'
HYPRLAND_INSTANCE_SIGNATURE=599ff9042c866dcad4bb458979f7be68a6d2ffef_1792048891_1969213314
KITTY_INSTALLATION_DIR=/usr/lib/kitty
KITTY_PID=2678
KITTY_PUBLIC_KEY='1:<o&7qi??Y<muF7l8$${GTY6W&MbYy68n2Y>y3x`V'
KITTY_WINDOW_ID=2
LANG=en_US.UTF-8
LOGNAME=dongfengpo
MAIL=/var/spool/mail/dongfengpo
MOTD_SHOWN=pam
MOZ_ENABLE_WAYLAND=1
OLDPWD=/home/dongfengpo
PAM_KWALLET5_LOGIN=/run/user/1000/kwallet5.socket
PATH=/home/dongfengpo/.cargo/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/lib/jvm/default/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:/usr/lib/rustup/bin:/home/hp/.local/bin:/home/hp/cp/:/home/dongfengpo/go/bin:/home/dongfengpo/.spicetify:/home/dongfengpo/.local/bin
PWD=/home/dongfengpo
SHELL=/usr/bin/zsh
SHLVL=1
TERM=xterm-kitty
TERMINAL=kitty
TERMINFO=/usr/lib/kitty/terminfo
USER=dongfengpo
VCPKG_DISABLE_METRICS=1
VCPKG_ROOT=/home/dongfengpo/vcpkg
VSSCRIPT_PATH=/usr/lib/python3.14/site-packages/vapoursynth/libvsscript.so
WAYLAND_DISPLAY=wayland-1
XCURSOR_SIZE=24
XDG_BACKEND=wayland
XDG_CURRENT_DESKTOP=Hyprland
XDG_DATA_DIRS=/home/dongfengpo/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share
XDG_RUNTIME_DIR=/run/user/1000
XDG_SEAT=seat0
XDG_SEAT_PATH=/org/freedesktop/DisplayManager/Seat0
XDG_SESSION_CLASS=user
XDG_SESSION_DESKTOP=Hyprland
XDG_SESSION_ID=2
XDG_SESSION_PATH=/org/freedesktop/DisplayManager/Session1
XDG_SESSION_TYPE=wayland
XDG_VTNR=2
_JAVA_AWT_WM_NONREPARENTING=1
VCS_INFO_adjust () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_bydir_detect () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_check_com () {
	setopt localoptions NO_shwordsplit
	case $1 in
		(/*) [[ -x $1 ]] && return 0 ;;
		(*) (( ${+commands[$1]} )) && return 0 ;;
	esac
	return 1
}
VCS_INFO_detect_bzr () {
	setopt localoptions NO_shwordsplit
	[[ $1 == '--flavours' ]] && return 1
	VCS_INFO_check_com bzr || return 1
	vcs_comm[detect_need_file]=branch/format 
	VCS_INFO_bydir_detect '.bzr'
	return $?
}
VCS_INFO_detect_cdv () {
	setopt localoptions NO_shwordsplit
	[[ $1 == '--flavours' ]] && return 1
	VCS_INFO_check_com ${vcs_comm[cmd]} || return 1
	vcs_comm[detect_need_file]=format 
	VCS_INFO_bydir_detect '.cdv'
	return $?
}
VCS_INFO_detect_cvs () {
	setopt localoptions NO_shwordsplit
	[[ $1 == '--flavours' ]] && return 1
	VCS_INFO_check_com ${vcs_comm[cmd]} || return 1
	if ! [[ -d "./CVS" ]] || ! [[ -r "./CVS/Repository" ]]
	then
		return 1
	fi
	local cvsbase="." 
	cvsbase=${cvsbase:P} 
	while [[ -d "${cvsbase:h}/CVS" ]]
	do
		cvsbase="${cvsbase:h}" 
		if [[ $cvsbase == '/' ]]
		then
			break
		fi
	done
	vcs_comm[basedir]="${cvsbase}" 
}
VCS_INFO_detect_darcs () {
	setopt localoptions NO_shwordsplit
	[[ $1 == '--flavours' ]] && return 1
	VCS_INFO_check_com ${vcs_comm[cmd]} || return 1
	vcs_comm[detect_need_file]=format 
	VCS_INFO_bydir_detect '_darcs'
	return $?
}
VCS_INFO_detect_fossil () {
	setopt localoptions NO_shwordsplit
	[[ $1 == '--flavours' ]] && return 1
	VCS_INFO_check_com ${vcs_comm[cmd]} || return 1
	vcs_comm[detect_need_file]="_FOSSIL_ .fslckout" 
	VCS_INFO_bydir_detect . || return 1
	return 0
}
VCS_INFO_detect_git () {
	setopt localoptions NO_shwordsplit
	[[ $1 == '--flavours' ]] && {
		print -l git-p4 git-svn
		return 0
	}
	if VCS_INFO_check_com ${vcs_comm[cmd]} && vcs_comm[gitdir]="$(${vcs_comm[cmd]} rev-parse --git-dir 2> /dev/null)" 
	then
		vcs_comm[basedir]="$( ${vcs_comm[cmd]} rev-parse --show-toplevel 2> /dev/null )" 
		if [[ -d ${vcs_comm[gitdir]}/svn ]]
		then
			vcs_comm[overwrite_name]='git-svn' 
		elif [[ -d ${vcs_comm[gitdir]}/refs/remotes/p4 ]]
		then
			vcs_comm[overwrite_name]='git-p4' 
		fi
		return 0
	fi
	return 1
}
VCS_INFO_detect_hg () {
	setopt localoptions NO_shwordsplit
	[[ $1 == '--flavours' ]] && {
		print -l hg-git hg-hgsubversion hg-hgsvn
		return 0
	}
	VCS_INFO_check_com ${vcs_comm[cmd]} || return 1
	vcs_comm[detect_need_file]="store data sharedpath" 
	VCS_INFO_bydir_detect '.hg' || return 1
	if [[ -d ${vcs_comm[basedir]}/.hg/svn ]]
	then
		vcs_comm[overwrite_name]='hg-hgsubversion' 
	elif [[ -d ${vcs_comm[basedir]}/.hgsvn ]]
	then
		vcs_comm[overwrite_name]='hg-hgsvn' 
	elif [[ -e ${vcs_comm[basedir]}/.hg/git-mapfile ]]
	then
		vcs_comm[overwrite_name]='hg-git' 
	fi
	return 0
}
VCS_INFO_detect_mtn () {
	setopt localoptions NO_shwordsplit
	[[ $1 == '--flavours' ]] && return 1
	VCS_INFO_check_com ${vcs_comm[cmd]} || return 1
	vcs_comm[detect_need_file]=revision 
	VCS_INFO_bydir_detect '_MTN'
	return $?
}
VCS_INFO_detect_p4 () {
	local serverport p4where
	if zstyle -t ":vcs_info:p4:${usercontext}:${rrn}" use-server
	then
		if (( ${#vcs_info_p4_dead_servers} ))
		then
			VCS_INFO_p4_get_server
			[[ -n $vcs_info_p4_dead_servers[$serverport] ]] && return 1
		fi
		if p4where="$(${vcs_comm[cmd]} where 2>&1)" 
		then
			return 0
		fi
		if [[ $p4where = *"Connect to server failed"* ]]
		then
			typeset -gA vcs_info_p4_dead_servers
			[[ -z $serverport ]] && VCS_INFO_p4_get_server
			vcs_info_p4_dead_servers[$serverport]=1 
		fi
		return 1
	else
		[[ -n ${P4CONFIG} ]] || return 1
		VCS_INFO_check_com ${vcs_comm[cmd]} || return 1
		vcs_comm[detect_need_file]="${P4CONFIG}" 
		VCS_INFO_bydir_detect .
		return $?
	fi
}
VCS_INFO_detect_svk () {
	setopt localoptions NO_shwordsplit
	[[ $1 == '--flavours' ]] && return 1
	setopt localoptions noksharrays extendedglob
	local -i fhash
	fhash=0 
	VCS_INFO_check_com ${vcs_comm[cmd]} || return 1
	[[ -f ~/.svk/config ]] || return 1
	while IFS= read -r line
	do
		if [[ -n ${vcs_comm[basedir]} ]]
		then
			line=${line## ##} 
			[[ ${line} == depotpath:* ]] && vcs_comm[branch]=${line##*/} 
			[[ ${line} == revision:* ]] && vcs_comm[revision]=${line##*[[:space:]]##} 
			[[ -n ${vcs_comm[branch]} ]] && [[ -n ${vcs_comm[revision]} ]] && break
			continue
		fi
		(( fhash > 0 )) && [[ ${line} == '  '[^[:space:]]*:* ]] && break
		[[ ${line} == '  hash:'* ]] && fhash=1  && continue
		(( fhash == 0 )) && continue
		[[ ${PWD}/ == ${${line## ##}%:*}/* ]] && vcs_comm[basedir]=${${line## ##}%:*} 
	done < ~/.svk/config
	[[ -n ${vcs_comm[basedir]} ]] && [[ -n ${vcs_comm[branch]} ]] && [[ -n ${vcs_comm[revision]} ]] && return 0
	return 1
}
VCS_INFO_detect_svn () {
	setopt localoptions NO_shwordsplit
	[[ $1 == '--flavours' ]] && return 1
	VCS_INFO_check_com ${vcs_comm[cmd]} || return 1
	vcs_comm[detect_need_file]="entries format wc.db" 
	VCS_INFO_bydir_detect '.svn' || return 1
}
VCS_INFO_detect_tla () {
	setopt localoptions NO_shwordsplit
	[[ $1 == '--flavours' ]] && return 1
	VCS_INFO_check_com ${vcs_comm[cmd]} || return 1
	vcs_comm[basedir]="$(${vcs_comm[cmd]} tree-root 2> /dev/null)"  && return 0
	return 1
}
VCS_INFO_formats () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_cmd () {
	local cmd
	zstyle -s ":vcs_info:${vcs}:${usercontext}:${rrn}" "command" cmd
	vcs_comm[cmd]=${cmd:-$vcs} 
}
VCS_INFO_get_data_bzr () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_data_cdv () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_data_cvs () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_data_darcs () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_data_fossil () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_data_git () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_data_hg () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_data_mtn () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_data_p4 () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_data_svk () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_data_svn () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_get_data_tla () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_hexdump () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_hook () {
	local hook static func
	local context hook_name
	local -i ret
	local -a hooks tmp
	local -i debug
	ret=0 
	hook_name="$1" 
	shift
	context=":vcs_info:${vcs}+${hook_name}:${usercontext}:${rrn}" 
	static=":vcs_info-static_hooks:${hook_name}" 
	zstyle -t "${context}" debug && debug=1  || debug=0 
	if (( debug ))
	then
		printf 'VCS_INFO_hook: running hook: "%s"\n' "${hook_name}"
		printf 'VCS_INFO_hook: current context: "%s"\n' "${context}"
		printf 'VCS_INFO_hook: static context: "%s"\n' "${static}"
	fi
	zstyle -a "${static}" hooks hooks
	if (( debug ))
	then
		printf '+ static hooks: %s\n' "${(j:, :)hooks}"
	fi
	zstyle -a "${context}" hooks tmp
	if (( debug ))
	then
		printf '+ context hooks: %s\n' "${(j:, :)tmp}"
	fi
	hooks+=("${tmp[@]}") 
	(( ${#hooks} == 0 )) && return 0
	typeset -g -r vcs rrn usercontext maxexports msgs vcs_comm
	for hook in ${hooks}
	do
		func="+vi-${hook}" 
		if (( ${+functions[$func]} == 0 ))
		then
			(( debug )) && printf '  + Unknown function: "%s"\n' "${func}"
			continue
		fi
		(( debug )) && printf '  + Running function: "%s"\n' "${func}"
		true
		${func} "$@"
		case $? in
			(0)  ;;
			(*) break ;;
		esac
	done
	typeset -g +r vcs rrn usercontext maxexports msgs vcs_comm
	return $ret
}
VCS_INFO_maxexports () {
	setopt localoptions NO_shwordsplit unset
	zstyle -s ":vcs_info:${vcs}:${usercontext}:${rrn}" "max-exports" maxexports || maxexports=2 
	if [[ ${maxexports} != <-> ]] || (( maxexports < 1 ))
	then
		printf 'vcs_info(): expecting numeric arg >= 1 for max-exports (got %s).\n' ${maxexports}
		printf 'Defaulting to 2.\n'
		maxexports=2 
	fi
	return 0
}
VCS_INFO_nvcsformats () {
	setopt localoptions noksharrays NO_shwordsplit
	local c v rr
	if [[ $1 == '-preinit-' ]]
	then
		c='default' 
		v='-preinit-' 
		rr='-all-' 
	fi
	zstyle -a ":vcs_info:${v:-$vcs}:${c:-$usercontext}:${rrn:-$rr}" nvcsformats msgs
	(( ${#msgs} > maxexports )) && msgs[${maxexports},-1]=() 
	return 0
}
VCS_INFO_p4_get_server () {
	emulate -L zsh
	setopt extendedglob
	local -a settings
	settings=(${(f)"$(${vcs_comm[cmd]} set)"}) 
	serverport=${${settings[(r)P4PORT=*]##P4PORT=}%% *} 
	case $serverport in
		(''|:) serverport=perforce:1666  ;;
		(:*) serverport=perforce${serverport}  ;;
		(*:) serverport=${serverport}1666  ;;
		(<->) serverport=perforce:${serverport}  ;;
	esac
}
VCS_INFO_patch2subject () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_quilt () {
	(( ${+functions[VCS_INFO_quilt-match]} )) || VCS_INFO_quilt-match () {
		emulate -L zsh
		setopt extendedglob
		local d mode="$1" param="$2" 
		local -a list
		case ${mode} in
			(assoc) list=(${(kOP)param})  ;;
			(array) : "${foo[@]}" ${(t)foo}
				list=(${(OP)param})  ;;
			(*) return 1 ;;
		esac
		for d in "${list[@]}"
		do
			if [[ ${PWD} == ${d%/##}(|/*) ]]
			then
				print "$d"
				return 0
			fi
		done
		return 1
	}
	(( ${+functions[VCS_INFO_quilt-standalone-detect]} )) || VCS_INFO_quilt-standalone-detect () {
		emulate -L zsh
		setopt extendedglob
		local param
		local -i ret
		zstyle -s "${context}" quilt-standalone param || return 1
		[[ "${param}" == 'never' ]] && return 1
		[[ "${param}" == 'always' ]] && return 0
		if (( ${+functions[$param]} ))
		then
			${param}
			return $?
		fi
		case ${(Pt)param} in
			(*association*) local m
				local -A A
				m="$(VCS_INFO_quilt-match assoc ${param})" 
				A=(${(kvP)param}) 
				(( $? == 0 )) && [[ ${A[$m]} == "true" ]] && return 0
				return 1 ;;
			(*array*) typeset -gU ${param}
				VCS_INFO_quilt-match array ${param} > /dev/null
				return $? ;;
			(*scalar*) [[ "${(P)param}" == 'always' ]] && return 0
				[[ "${(P)param}" == 'never' ]] && return 1 ;;
		esac
		return 1
	}
	(( ${+functions[VCS_INFO_quilt-dirfind]} )) || VCS_INFO_quilt-dirfind () {
		emulate -L zsh
		setopt extendedglob
		local dir="$1" file="$2" 
		shift $#
		local ret oldfile olddir
		olddir=${vcs_comm[basedir]} 
		vcs_comm[basedir]='' 
		oldfile=${vcs_comm[detect_need_file]} 
		vcs_comm[detect_need_file]=${file} 
		VCS_INFO_bydir_detect ${dir}
		ret=$? 
		vcs_comm[detect_need_file]=${oldfile} 
		REPLY=${vcs_comm[basedir]} 
		vcs_comm[basedir]="${olddir}" 
		return ${ret}
	}
	(( ${+functions[VCS_INFO_quilt-patch2subject]} )) || VCS_INFO_quilt-patch2subject () {
		VCS_INFO_patch2subject "$@"
	}
	{
		emulate -L zsh
		setopt extendedglob
		local mode="$1" 
		local patches pc qstring root
		local -i ret
		local context
		local -a applied unapplied applied_string unapplied_string quiltcommand quilt_env
		local -A hook_com
		context=":vcs_info:${vcs}.quilt-${mode}:${usercontext}:${rrn}" 
		zstyle -t "${context}" use-quilt || return 1
		case ${mode} in
			(standalone) VCS_INFO_quilt-standalone-detect || return 1 ;;
			(addon)  ;;
			(*) printf 'Invalid mode: `%s'\''\n' "$1"
				return 2 ;;
		esac
		if VCS_INFO_quilt-dirfind .pc .version
		then
			pc=$REPLY 
			[[ ${quiltmode} == 'standalone' ]] && root=${pc} 
			pc=${pc}/.pc 
			if [[ -e ${pc}/applied-patches ]]
			then
				applied=(${(f)"$(<$pc/applied-patches)"}) 
				applied=(${applied:#}) 
				applied=(${(Oa)applied}) 
			else
				applied=() 
			fi
			patches=$(<$pc/.quilt_patches) 
			patches=`builtin cd -q "${pc:h}" && print -r - ${patches:P}` 
		else
			zstyle -s "${context}" quilt-patch-dir patches || patches="${QUILT_PATCHES}" 
			: ${patches:="patches"}
			if [[ "${patches}" != /* ]]
			then
				if VCS_INFO_quilt-dirfind "${patches}"
				then
					patches=$REPLY/$patches 
				else
					return $?
				fi
			else
				[[ -d ${patches} ]] || return 1
			fi
			quilt_env+=(QUILT_PATCHES="$patches") 
		fi
		if zstyle -t "${context}" get-unapplied
		then
			zstyle -s "${context}" quiltcommand quiltcommand || quiltcommand='quilt' 
			unapplied=(${(f)"$(if (( $+quilt_env[1] )); then export ${quilt_env[@]}; fi
                            $quiltcommand --quiltrc /dev/null unapplied 2> /dev/null)"}) 
			unapplied=(${unapplied:#}) 
		else
			unapplied=() 
		fi
		{
			local i
			for ((i=1; i<=$#applied; i++)) do
				if VCS_INFO_quilt-patch2subject "$patches/$applied[$i]" && (( $+REPLY ))
				then
					applied[$i]+=" $REPLY" 
				else
					applied[$i]+=" ?" 
				fi
			done
			for ((i=1; i<=$#unapplied; i++)) do
				if VCS_INFO_quilt-patch2subject "$patches/$unapplied[$i]" && (( $+REPLY ))
				then
					unapplied[$i]+=" $REPLY" 
				else
					unapplied[$i]+=" ?" 
				fi
			done
		}
		typeset -A quilt_extra_info=(quilt-patches-dir ${patches} ${pc:+"quilt-pc-dir"} $pc) 
		VCS_INFO_set-patch-format 'applied' 'applied_string' 'unapplied' 'unapplied_string' ${context} qstring quilt_extra_info '' quilt_extra_info
		qstring=$REPLY 
		case ${mode} in
			(standalone) backend_misc[patches]=${qstring} 
				VCS_INFO_formats '' '' "${root}" '' '' '' "${qstring}"
				VCS_INFO_set ;;
			(addon) REPLY="${qstring}"  ;;
		esac
		VCS_INFO_hook 'post-quilt' ${mode} ${patches} ${pc:-\\-nopc-}
	}
}
VCS_INFO_quilt-dirfind () {
	emulate -L zsh
	setopt extendedglob
	local dir="$1" file="$2" 
	shift $#
	local ret oldfile olddir
	olddir=${vcs_comm[basedir]} 
	vcs_comm[basedir]='' 
	oldfile=${vcs_comm[detect_need_file]} 
	vcs_comm[detect_need_file]=${file} 
	VCS_INFO_bydir_detect ${dir}
	ret=$? 
	vcs_comm[detect_need_file]=${oldfile} 
	REPLY=${vcs_comm[basedir]} 
	vcs_comm[basedir]="${olddir}" 
	return ${ret}
}
VCS_INFO_quilt-match () {
	emulate -L zsh
	setopt extendedglob
	local d mode="$1" param="$2" 
	local -a list
	case ${mode} in
		(assoc) list=(${(kOP)param})  ;;
		(array) : "${foo[@]}" ${(t)foo}
			list=(${(OP)param})  ;;
		(*) return 1 ;;
	esac
	for d in "${list[@]}"
	do
		if [[ ${PWD} == ${d%/##}(|/*) ]]
		then
			print "$d"
			return 0
		fi
	done
	return 1
}
VCS_INFO_quilt-patch2subject () {
	VCS_INFO_patch2subject "$@"
}
VCS_INFO_quilt-standalone-detect () {
	emulate -L zsh
	setopt extendedglob
	local param
	local -i ret
	zstyle -s "${context}" quilt-standalone param || return 1
	[[ "${param}" == 'never' ]] && return 1
	[[ "${param}" == 'always' ]] && return 0
	if (( ${+functions[$param]} ))
	then
		${param}
		return $?
	fi
	case ${(Pt)param} in
		(*association*) local m
			local -A A
			m="$(VCS_INFO_quilt-match assoc ${param})" 
			A=(${(kvP)param}) 
			(( $? == 0 )) && [[ ${A[$m]} == "true" ]] && return 0
			return 1 ;;
		(*array*) typeset -gU ${param}
			VCS_INFO_quilt-match array ${param} > /dev/null
			return $? ;;
		(*scalar*) [[ "${(P)param}" == 'always' ]] && return 0
			[[ "${(P)param}" == 'never' ]] && return 1 ;;
	esac
	return 1
}
VCS_INFO_reposub () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_set () {
	setopt localoptions noksharrays NO_shwordsplit unset
	local -i i j
	if [[ $1 == '--nvcs' ]]
	then
		[[ $2 == '-preinit-' ]] && (( maxexports == 0 )) && (( maxexports = 1 ))
		for i in {0..$((maxexports - 1))}
		do
			typeset -g vcs_info_msg_${i}_=
		done
		VCS_INFO_nvcsformats $2
		[[ $2 != '-preinit-' ]] && VCS_INFO_hook "no-vcs"
	fi
	(( ${#msgs} - 1 < 0 )) && return 0
	for i in {0..$(( ${#msgs} - 1 ))}
	do
		(( j = i + 1 ))
		typeset -g vcs_info_msg_${i}_=${msgs[$j]}
	done
	if (( i < maxexports ))
	then
		for j in {$(( i + 1 ))..${maxexports}}
		do
			[[ -n ${(P)${:-vcs_info_msg_${j}_}} ]] && typeset -g vcs_info_msg_${j}_=
		done
	fi
	return 0
}
VCS_INFO_set-branch-format () {
	# undefined
	builtin autoload -XUz
}
VCS_INFO_set-patch-format () {
	# undefined
	builtin autoload -XUz
}
__zoxide_cd () {
	\builtin cd -- "$@"
}
__zoxide_doctor () {
	[[ ${_ZO_DOCTOR:-1} -ne 0 ]] || return 0
	[[ $- == *i* ]] || return 0
	[[ ${chpwd_functions[(Ie)__zoxide_hook]:-} -eq 0 ]] || return 0
	_ZO_DOCTOR=0 
	\builtin printf '%s\n' 'zoxide: detected a possible configuration issue.' 'Please ensure that zoxide is initialized right at the end of your shell configuration file (usually ~/.zshrc).' '' 'If the issue persists, consider filing an issue at:' 'https://github.com/ajeetdsouza/zoxide/issues' '' 'Disable this message by setting _ZO_DOCTOR=0.' '' >&2
}
__zoxide_hook () {
	\command zoxide add -- "$(__zoxide_pwd)"
}
__zoxide_pwd () {
	\builtin pwd -L
}
__zoxide_z () {
	__zoxide_doctor
	if [[ "$#" -eq 0 ]]
	then
		__zoxide_cd ~
	elif [[ "$#" -eq 1 ]] && [[ "$1" = '-' ]]
	then
		__zoxide_cd "${OLDPWD}"
	elif [[ "$#" -eq 1 ]] && {
			[[ "$1" =~ ^[-+][0-9]+$ ]] || (
				\builtin cd -q -- "$1"
			) &> /dev/null
		}
	then
		__zoxide_cd "$1"
	elif [[ "$#" -eq 2 ]] && [[ "$1" = "--" ]]
	then
		__zoxide_cd "$2"
	else
		\builtin local result
		result="$(\command zoxide query --exclude "$(__zoxide_pwd)" -- "$@")"  && __zoxide_cd "${result}"
	fi
}
__zoxide_z_complete () {
	[[ "${#words[@]}" -eq "${CURRENT}" ]] || return 0
	if [[ "${#words[@]}" -eq 2 ]]
	then
		_cd -/
	elif [[ "${words[-1]}" == '' ]]
	then
		__zoxide_result="$(\command zoxide query --exclude "$(__zoxide_pwd || \builtin true)" --interactive -- ${words[2,-1]} 2>/dev/null)"  || __zoxide_result='' 
		compadd -Q -S "" -- ""
		\builtin bindkey '\e[0n' '__zoxide_z_complete_helper'
		\builtin printf '\e[5n'
		return 0
	fi
}
__zoxide_z_complete_helper () {
	if [[ -n "${__zoxide_result}" ]]
	then
		BUFFER="z ${(q-)__zoxide_result}" 
		__zoxide_result='' 
		\builtin zle reset-prompt
		\builtin zle accept-line
	else
		\builtin zle reset-prompt
	fi
}
__zoxide_zi () {
	__zoxide_doctor
	\builtin local result
	result="$(\command zoxide query --interactive -- "$@")"  && __zoxide_cd "${result}"
}
_ksi_debug_print () {
	builtin local data
	data=$(builtin command base64 <<<"${(j: :)@}")  || builtin return
	builtin print -nu "$_ksi_fd" '\eP@kitty-print|'"${data//[[:space:]]}"'\e\\'
}
_ksi_precmd () {
	builtin local -i cmd_status=$?
	builtin emulate -L zsh -o no_warn_create_global -o no_aliases
	if ! builtin zle
	then
		if (( _ksi_state == 1 ))
		then
			builtin print -nu $_ksi_fd '\e]133;D;'$cmd_status'\a'
			(( _ksi_state = 2 ))
		elif (( _ksi_state == 2 ))
		then
			builtin print -nu $_ksi_fd '\e]133;D\a'
		fi
	fi
	builtin local mark1=$'%{\e]133;A\a%}'
	if [[ -o prompt_percent ]]
	then
		builtin typeset -g precmd_functions
		if [[ ${precmd_functions[-1]} == _ksi_precmd ]]
		then
			builtin local mark2=$'%{\e]133;A;k=s\a%}'
			[[ $PS1 == *$mark1* ]] || PS1=${mark1}${PS1} 
			[[ $PS2 == *$mark2* ]] || PS2=${mark2}${PS2} 
			(( _ksi_state = 2 ))
		else
			precmd_functions=(${precmd_functions:#_ksi_precmd} _ksi_precmd) 
			if ! builtin zle
			then
				builtin print -rnu $_ksi_fd -- $mark1[3,-3]
				(( _ksi_state = 2 ))
			fi
		fi
	elif ! builtin zle
	then
		builtin print -rnu $_ksi_fd -- $mark1[3,-3]
		(( _ksi_state = 2 ))
	fi
	_ksi_report_pwd
	builtin print -rnu 13 $'\e]2;'"${(%):-%(4~|…/%3~|%~)}"$'\a'
}
_ksi_preexec () {
	builtin emulate -L zsh -o no_warn_create_global -o no_aliases
	PS1=${PS1//$'%{\e]133;A\a%}'} 
	PS2=${PS2//$'%{\e]133;A;k=s\a%}'} 
	builtin print -nu "$_ksi_fd" -f '\e]133;C;cmdline=%q\a' -- "$1"
	(( _ksi_state = 1 ))
	builtin print -rnu 13 $'\e]2;'"${(V)1}"$'\a'
}
_ksi_report_pwd () {
	builtin print -nu $_ksi_fd '\e]7;kitty-shell-cwd://'"$HOST""$PWD"'\a'
}
_ksi_transmit_data () {
	builtin local data="${1//[[:space:]]}"
	builtin local pos=0
	builtin local chunk_num=0
	while [ $pos -lt ${#data} ]
	do
		builtin local chunk="${data:$pos:2048}"
		pos=$(($pos+2048)) 
		builtin print -nu "$_ksi_fd" -f '\eP@kitty-%s|%s:%s\e\\' "${2}" "${chunk_num}" "${chunk}"
		chunk_num=$(($chunk_num+1)) 
	done
	[ "$3" = "save_history" ] && builtin fc -AI
	builtin print -nu "$_ksi_fd" -f '\eP@kitty-%s|\e\\' "${2}"
}
build () {
	if [[ $# -lt 1 ]]
	then
		echo "Usage:"
		echo "  build <file.cpp>"
		echo "  build <file.cpp> <input.txt>"
		echo "  build <file.cpp> <input.txt> <output.txt>"
		echo "  build <file.cpp> --only"
		return 1
	fi
	local src="$1" 
	local base="${src%.cpp}" 
	local exe="./$base" 
	if [[ ! -f "$src" ]]
	then
		echo "Error: $src not found"
		return 1
	fi
	local start=$SECONDS 
	echo "▶ Compiling $src ..."
	clang++ -Wall -DDEBUG -g -march=native -std=c++23 -pipe -fuse-ld=lld -D_GLIBCXX_DEBUG "$src" -o "$base"
	local ret=$? 
	local elapsed=$((SECONDS - start)) 
	if [[ $ret -ne 0 ]]
	then
		echo "✖ Compilation failed (${elapsed}s)"
		return 1
	fi
	echo "✔ Compilation finished in ${elapsed}s → $exe"
	echo -ne "\a"
	if [[ "$2" == "--only" ]]
	then
		return 0
	fi
	if [[ $# -eq 1 ]]
	then
		$exe
	elif [[ $# -eq 2 ]]
	then
		$exe < "$2"
	else
		$exe < "$2" > "$3"
	fi
}
clone-in-kitty () {
	builtin local data="shell=zsh,pid=$$,cwd=$(builtin printf "%s" "$PWD" | builtin command base64)"
	while :
	do
		case "$1" in
			("") break ;;
			(-h | --help) builtin printf "%s\n\n%s\n" "Clone the current zsh session into a new kitty window." "For usage instructions see: https://sw.kovidgoyal.net/kitty/shell-integration/#clone-shell"
				builtin return ;;
			(*) data="$data,a=$(builtin printf "%s" "$1" | builtin command base64)"  ;;
		esac
		shift
	done
	builtin local env
	builtin local env_vars
	builtin local varname
	env_vars=(${(f)"$(builtin export)"}) 
	for i in $env_vars
	do
		varname="${i%%=*}" 
		env="${env}$(builtin printf "%s=%s\0" "$varname" "${(P)varname}")" 
	done
	data="$data,env=$(builtin printf "%s" "$env" | builtin command base64)" 
	_ksi_transmit_data "$data" "clone" "save_history"
}
is-at-least () {
	emulate -L zsh
	local IFS=".-" min_cnt=0 ver_cnt=0 part min_ver version order 
	min_ver=(${=1}) 
	version=(${=2:-$ZSH_VERSION} 0) 
	while (( $min_cnt <= ${#min_ver} ))
	do
		while [[ "$part" != <-> ]]
		do
			(( ++ver_cnt > ${#version} )) && return 0
			if [[ ${version[ver_cnt]} = *[0-9][^0-9]* ]]
			then
				order=(${version[ver_cnt]} ${min_ver[ver_cnt]}) 
				if [[ ${version[ver_cnt]} = <->* ]]
				then
					[[ $order != ${${(On)order}} ]] && return 1
				else
					[[ $order != ${${(O)order}} ]] && return 1
				fi
				[[ $order[1] != $order[2] ]] && return 0
			fi
			part=${version[ver_cnt]##*[^0-9]} 
		done
		while true
		do
			(( ++min_cnt > ${#min_ver} )) && return 0
			[[ ${min_ver[min_cnt]} = <-> ]] && break
		done
		(( part > min_ver[min_cnt] )) && return 0
		(( part < min_ver[min_cnt] )) && return 1
		part='' 
	done
}
precmd () {
	vcs_info
}
vcs_info () {
	emulate -L zsh
	setopt extendedglob NO_warn_create_global
	[[ -r . ]] || return 0
	local pat
	local -i found retval
	local -a enabled disabled dps
	local usercontext vcs rrn quiltmode
	local -x LC_MESSAGES
	local -i maxexports
	local -a msgs
	local -A vcs_comm hook_com backend_misc user_data
	LC_MESSAGES=C 
	if [[ -n ${LC_ALL} ]]
	then
		local -x LANG
		LANG=${LC_ALL} 
		local -x LC_ALL
	fi
	vcs='-init-' 
	rrn='-all-' 
	quiltmode='addon' 
	usercontext=${1:-default} 
	VCS_INFO_hook "start-up"
	retval=$? 
	if (( retval == 1 ))
	then
		return 0
	elif (( retval == 2 ))
	then
		VCS_INFO_maxexports
		VCS_INFO_set --nvcs
		return 0
	fi
	zstyle -a ":vcs_info:${vcs}:${usercontext}:${rrn}" "enable" enabled
	(( ${#enabled} == 0 )) && enabled=(all) 
	if [[ -n ${(M)enabled:#(#i)none} ]]
	then
		[[ -n ${vcs_info_msg_0_} ]] && VCS_INFO_set --nvcs
		return 0
	fi
	if [[ -n ${(M)enabled:#(#i)all} ]]
	then
		enabled=(${VCS_INFO_backends}) 
		zstyle -a ":vcs_info:${vcs}:${usercontext}:${rrn}" "disable" disabled
	fi
	zstyle -a ":vcs_info:${vcs}:${usercontext}:${rrn}" "disable-patterns" dps
	for pat in ${dps}
	do
		if [[ ${PWD} == ${~pat} ]]
		then
			VCS_INFO_maxexports
			[[ -n ${vcs_info_msg_0_} ]] && VCS_INFO_set --nvcs
			return 0
		fi
	done
	VCS_INFO_maxexports
	(( found = 0 ))
	for vcs in ${enabled}
	do
		[[ -n ${(M)disabled:#${vcs}} ]] && continue
		if (( ${+functions[VCS_INFO_detect_${vcs}]} == 0 ))
		then
			printf 'vcs_info: configured unknown backend: '\''%s'\''\n' ${vcs}
			printf 'vcs_info: use '\''vcs_info_printsys'\'' to find supported systems.\n'
			continue
		fi
		vcs_comm=() 
		VCS_INFO_get_cmd
		VCS_INFO_detect_${vcs} && (( found = 1 )) && break
	done
	(( found == 0 )) && {
		vcs='-quilt-' 
		quiltmode='standalone' 
		VCS_INFO_quilt standalone || VCS_INFO_set --nvcs
		return 0
	}
	VCS_INFO_hook "pre-get-data"
	retval=$? 
	if (( retval == 1 ))
	then
		return 0
	elif (( retval == 2 ))
	then
		VCS_INFO_set --nvcs
		return 0
	fi
	VCS_INFO_get_data_${vcs} || {
		VCS_INFO_set --nvcs
		return 1
	}
	VCS_INFO_set
	return 0
}
vcs_info_hookadd () {
	# undefined
	builtin autoload -XUz
}
vcs_info_hookdel () {
	# undefined
	builtin autoload -XUz
}
vcs_info_lastmsg () {
	# undefined
	builtin autoload -XUz
}
vcs_info_printsys () {
	# undefined
	builtin autoload -XUz
}
vcs_info_setsys () {
	emulate -L zsh
	setopt extendedglob typeset_silent
	local sys
	typeset -ga VCS_INFO_backends
	local -a match mbegin mend
	VCS_INFO_backends=() 
	for file in ${^fpath}/VCS_INFO_get_data_*~*(\~|.zwc)(N)
	do
		file=${file:t} 
		: ${file:#(#b)VCS_INFO_get_data_(*)}
		sys=${match[1]} 
		[[ -n ${(M)VCS_INFO_backends:#${sys}} ]] && continue
		VCS_INFO_backends+=(${sys}) 
		autoload -Uz VCS_INFO_detect_${sys}
		autoload -Uz VCS_INFO_get_data_${sys}
	done
	return 0
}
y () {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd 
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
z () {
	__zoxide_z "$@"
}
zi () {
	__zoxide_zi "$@"
}
