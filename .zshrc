# Path to your oh-my-zsh installation.
export ZSH=/Users/matthewpassmore/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export NVM_LAZY_LOAD=true
plugins=(git z history-substring-search zsh-nvm osx wp-cli)

# User configuration

# export PATH="$(brew --prefix homebrew/php/php70)/bin:/usr/local/sbin:$PATH"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/id_rsa"
# export SSH_AUTH_SOCK="/Users/matthewpassmore/.ssh-agent.sock"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias virtual="sudo vim /private/etc/hosts /Applications/MAMP/conf/apache/extra/httpd-vhosts.conf"
alias wpinstall="~/wpinstall.sh"
alias cl="clear"
alias tm="t mod"
alias ta="t add"
alias td="clear && t +ACTIVE or due.before:tomorrow or tag:next list"
alias tdd="clear && t +ACTIVE or due.before:tomorrow or tag:next or scheduled.before:tomorrow list"
alias tds="clear && t +dash list"
alias x="tmux"
alias xa="tmux attach -t"
# alias ll="ls -ltrh"
alias ll="ls -alF"
alias gundo="git reset --soft HEAD^"
alias gwait="git reset HEAD"
alias gabort="git checkout ."
alias grom="git rebase origin/master"
alias re="clear && printf '\e[3J'"
alias bgl="base16_one-light"
alias bgd="base16_nord"
alias start="npm run start"

alias config='/usr/bin/git --git-dir=/Users/matthewpassmore/.dotfiles/ --work-tree=/Users/matthewpassmore'

# Functions

function tre() {
    tree $@ | less -X
}

function tree() {
    command tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less -FRNX;
}

# Efficient image resizing
# @link https://www.smashingmagazine.com/2015/06/efficient-image-resizing-with-imagemagick/ 
# example use:  smartresize inputfile.png 300 outputdir/
smartresize() {
   mogrify -path $3 -filter Triangle -define filter:support=2 -thumbnail $2 -unsharp 0.25x0.08+8.3+0.045 -dither None -posterize 136 -quality 82 -define jpeg:fancy-upsampling=off -define png:compression-filter=5 -define png:compression-level=9 -define png:compression-strategy=1 -define png:exclude-chunk=all -interlace none -colorspace sRGB $1
}

# Convert markdown to rich-text-format and copy to clipboard
# @link https://bendyworks.com/cut-paste-rich-text-pandoc-markdown/
# example use: md2rt scratchpad.md
md2rt() {
  pandoc --standalone --from=markdown --to=rtf --output=- "$1" | pbcopy
}

# Add syntax highlighting plugin via Homebrew
# @link https://github.com/zsh-users/zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# #
# # Use single ssh-agent launched by launchd
# #
# export SSH_ASKPASS=/usr/local/bin/ssh-ask-keychain
# if test -f $HOME/.ssh-agent-pid && kill -0 `cat $HOME/.ssh-agent-pid` 2>/dev/null; then
#   SSH_AUTH_SOCK=`cat $HOME/.ssh-auth-sock`
#   SSH_AGENT_PID=`cat $HOME/.ssh-agent-pid`
#   export SSH_AUTH_SOCK SSH_AGENT_PID
# else

#   # Discover the running ssh-agent started by launchd
#   export SSH_AGENT_PID=$(pgrep -U $USER ssh-agent)
#   if [ -n "$SSH_AGENT_PID" ]; then
#     export SSH_AUTH_SOCK=$(lsof -U -a -p $SSH_AGENT_PID -F n | grep '^n/' | cut -c2-)
#     echo "$SSH_AUTH_SOCK" >! ${HOME}/.ssh-auth-sock
#     echo "$SSH_AGENT_PID" >! ${HOME}/.ssh-agent-pid
#   else
#     echo "No running ssh-agent found.  Check your launchd service."
#   fi

#   # Add all the local keys, getting the passphrase from keychain, helped by the $SSH_ASKPASS script.
#   ssh-add < /dev/null
# fi

# NL="\n"
# local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
# PROMPT="in %{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)
# ${ret_status} "

# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
# ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Auto-completion for wp-cli
autoload bashcompinit
bashcompinit
source ~/wp-completion.bash

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# want your terminal to support 256 color schemes? I do ...
export TERM="xterm-256color"
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/usr/local/opt/php@7.1/bin:$PATH"
export PATH="/usr/local/opt/php@7.1/sbin:$PATH"
# export PATH="/usr/local/opt/php@7.2/bin:$PATH"
# export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
# export PATH="/usr/local/opt/php@7.3/bin:$PATH"
# export PATH="/usr/local/opt/php@7.3/sbin:$PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH="/usr/local/opt/icu4c/bin:$PATH"
export PATH="/usr/local/opt/icu4c/sbin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 96% --reverse --preview "cat {}"'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow -g "!{node_modules,.git,vendor}"'

# Customise prompt via Starship
# @link https://starship.rs/config/#prompt
# eval "$(starship init zsh)"
