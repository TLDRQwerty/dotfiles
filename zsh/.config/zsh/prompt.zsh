setopt prompt_subst

preexec() {
  cmdStart="$SECONDS"

  # Set the title
  print -Pn "\e]0;| $(pwd) |\a"
}

precmd() {
  local cmdEnd="$SECONDS"
  elapsed=$((cmdEnd-cmdStart))
}

function getExecutionTime() {
  [[ $elapsed -gt 0 ]] && echo "$elapsed"
}

function getPrompt() {
  [[ -d '.git' ]] && echo "[$(git branch --show-current)]"
}

function getNVM() {
  [[ -f '.nvmrc' ]] && echo "Node: $(nvm current)"
}

function getErrorCode() {
  echo '%(?..%?)'
}

function getJobs() {
  echo " $(jobs | awk '{ print $1 }')"
}

PROMPT='$(getPrompt)$(getJobs)%~>'
RPROMPT='$(getExecutionTime) $(getNVM) $(getErrorCode)'

