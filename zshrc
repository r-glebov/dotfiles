# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="spaceship"
plugins=(git vi-mode)
source $ZSH/oh-my-zsh.sh

export EDITOR=nvim




# FZF
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --smart-case --glob "!.git/*" --glob "!node_modules/*"'
function my_init() {
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
}
zvm_after_init_commands+=(my_init)

alias ts='tig status'
alias tm='tig'
alias ocw='overmind c web'
alias orw='overmind restart web'
alias gb="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) | %(authorname) | (%(color:green)%(committerdate:relative)%(color:reset))| %(contents:subject) ' | column -t -s '|'"

alias rc='bundle exec rails console'
alias rdm='bundle exec rails db:migrate'
alias rdms='bundle exec rails db:migrate:status'
alias rdr='bundle exec rails db:rollback'

alias ta="tmux -u attach"

HISTSIZE=10000000
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=121'


export GEM_HOME="$HOME/.rvm/gems/ruby-2.6.3@status-page"
export PATH="$HOME/.rvm/rubies/ruby-2.6.3/bin:$PATH"
#export PATH="/usr/local/opt/ruby/bin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

export PATH=/usr/local/Cellar/bison/3.8.2/bin:$PATH
