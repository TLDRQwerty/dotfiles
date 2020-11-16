autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "(%b) %m %u %c"
zstyle ':vcs_info:*' unstagedstr '⛌'
zstyle ':vcs_info:*' stagedstr '●'

zstyle ':vcs_info:*+*:*' debug  false


zstyle ':vcs_info:git+post-backend:*' hooks git-post-backend-updown

+vi-git-post-backend-updown() {
	git rev-parse @{upstream} >/dev/null 2>&1 || return
	local -a x; x=( $(git rev-list --left-right --count HEAD...@{upstream} ) )
	hook_com[branch]+="%f" # end coloring
	(( x[2] )) && hook_com[branch]+=" $x[2]˅"
	(( x[1] )) && hook_com[branch]+=" $x[1]˄"
	return 0
}

# Show untracked files

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked

+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='T'
    fi
}

precmd() {
	vcs_info
}

setopt prompt_subst

PROMPT='%~ ${vcs_info_msg_0_}| '
