autoload -Uz vcs_info
autoload -U colors && colors

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt PROMPT_SUBST

+vi-git-untracked(){
  local -a st
  st=($(git status --porcelain 2>/dev/null))
  if (( $#st )); then
    hook_com[misc]+='%F{red}+'
  fi
}

+vi-git-st(){
  local ahead behind
  local -a gitstatus

  git rev-parse ${hook_com[branch]}@{upstream} >/dev/null 2>&1 || return 0

  local -a ahead_and_behind=($(git rev-list --left-right --count HEAD...${hook_com[branch]}@{upstream}))

  ahead=${ahead_and_behind[1]}
  behind=${ahead_and_behind[2]}

  if (( $ahead )); then
    gitstatus+=("%F{cyan}↑$ahead")
  fi
  if (( $behind )); then
    gitstatus+=("%F{magenta}↓$behind")
  fi
  hook_com[misc]+="${(j:/:)gitstatus}"
}

+vi-git-stash(){
  local -a stashes
  stashes=($(git stash list 2>/dev/null | wc -l))
  if (( $stashes != "0" )); then
    hook_com[misc]+="%F{yellow}⚑${stashes}"
  fi
}

# Enable extra hooks to run
# zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-st git-stash
zstyle ':vcs_info:git*+set-message:*' hooks git-untracked git-stash

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' check-for-staged-changes true
zstyle ':vcs_info:git:*' get-revision true

zstyle ':vcs_info:git:*' stagedstr '!'
zstyle ':vcs_info:git:*' unstagedstr '?'

zstyle ':vcs_info:*' formats ' [%b]%m%u%c'
zstyle ':vcs_info:*' actionformats ' [%b|%a]%u%c'

zstyle ':vcs_info:*' debug false

PROMPT='%F{blue}%~%f %F{red}${vcs_info_msg_0_}%f$ '
# RPROMPT='%(?..%F{red}%?%f)'
