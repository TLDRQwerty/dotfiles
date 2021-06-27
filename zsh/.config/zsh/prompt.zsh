autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git

precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

# Enables the additional hooks below
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-st git-stash

# Show any files that are untracked by git
+vi-git-untracked(){
if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
	git status --porcelain | grep '??' &> /dev/null ; then
	# This will show the marker if there are any untracked files in repo.
	# If instead you want to show the marker only if there are untracked
	# files in $PWD, use:
	#[[ -n $(git ls-files --others --exclude-standard) ]] ; then
	hook_com[staged]+="%{$fg[blue]%}%{$reset_color%}" # signify new files with a bang
	fi
}

# Show difference between local and remote
function +vi-git-st() {
local ahead behind
local -a gitstatus

		# Exit early in case the worktree is on a detached HEAD
		git rev-parse ${hook_com[branch]}@{upstream} >/dev/null 2>&1 || return 0

		local -a ahead_and_behind=(
		$(git rev-list --left-right --count HEAD...${hook_com[branch]}@{upstream} 2>/dev/null)
	)

	ahead=${ahead_and_behind[1]}
	behind=${ahead_and_behind[2]}

	(( $ahead )) && gitstatus+=( " ${ahead}" )
	(( $behind )) && gitstatus+=( " ${behind}" )

	hook_com[misc]+=${(j:/:)gitstatus}
}

# Show stash status
function +vi-git-stash() {
local -a stashes

if [[ -s ${hook_com[base]}/.git/refs/stash ]] ; then
	stashes=$(git stash list 2>/dev/null | wc -l)
	# 
	hook_com[misc]+=" (${stashes} %{$fg[yellow]%}%{$reset_color%} )"
fi
}

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-staged-changes true
zstyle ':vcs_info:git:*' get-revision true

zstyle ':vcs_info:*' unstagedstr "%{$fg[red]%}%{$reset_color%}"
zstyle ':vcs_info:*' stagedstr "%{$fg[green]%}%{$reset_color%}"

zstyle ':vcs_info:git:*' formats '(%b) %m [%u%c]'
zstyle ':vcs_info:git:*' actionformats '(%b) [%a - %7.7i | %m%u%c]'

precmd_vcs_info() { 
	vcs_info

	# And then just set PS1, RPS1 and whatever you want to. This $PS1
	# is (as with the other examples above too) just an example of a very
	# basic single-line prompt. See "man zshmisc" for details on how to
	# make this less readable. :-)
	if [[ -z ${vcs_info_msg_0_} ]]; then
		# Oh hey, nothing from vcs_info, so we got more space.
		# Let's print a longer part of $PWD...
		PS1="%5~% -> "
	else
		# vcs_info found something, that needs space. So a shorter $PWD
		# makes sense.
		PS1="%3~ ${vcs_info_msg_0_}%  -> "
	fi
}
