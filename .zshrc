# General autocompletions
eval "$(aws-vault --completion-script-zsh)"

# autocomplete for host names for ssh from ~/.ssh/host.config
# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

if [[ -r ~/.ssh/host.config ]]; then
  _hosts=($_hosts ${${${(@M)${(f)"$(cat ~/.ssh/host.config)"}:#Host *}#Host }:#*[*?]*})
  zstyle ':completion:*:ssh:*' hosts $_hosts
  unset _hosts
fi

# Initialize the autocompletion
autoload -Uz compinit && compinit -i
