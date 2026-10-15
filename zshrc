zplug 'mafredri/zsh-async', from:github
zplug 'sindresorhus/pure', use:pure.zsh, from:github, as:theme
zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-completions'

zplug load

for zsh_source in $HOME/.zsh/configs/*.zsh; do
  source $zsh_source
done

autoload -U promptinit; promptinit

alias sha="date +%s | sha1sum | awk '{print $1}' | cut -c 1-10 -"
alias x="claude --dangerously-skip-permissions"
alias getip="ifconfig | grep en0 -C 3"

# Use a separate tool to smartly ignore files
export FZF_DEFAULT_COMMAND='rg --hidden --files --ignore-file ~/.ignore'
. "$HOME/.local/bin/env"

. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
eval "$(atuin init zsh)"
