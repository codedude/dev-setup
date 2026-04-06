# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"


# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(
    git
    zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export EDITOR=nvim
alias vim=nvim
alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias dev="cd /Users/valentin/Dev"
alias elan="cd /Users/valentin/Dev/Agence\ web/elan-numerique"
alias pyenv="source ~/Dev/pyenv/bin/activate"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/Users/valentin/.composer/vendor/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
alias fixlibrewolf="xattr -dr com.apple.quarantine /Applications/LibreWolf.app"
#export PATH="/opt/homebrew/opt/make/libexec/gnubin:$PATH"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
source <(fzf --zsh)
. "$HOME/.cargo/env"
eval $(thefuck --alias)

[ -f "/Users/valentin/.ghcup/env" ] && . "/Users/valentin/.ghcup/env" # ghcup-env
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/valentin/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

alias tmuxs="~/.local/bin/tmux-sessionizer ~/Dev"

alias ray="cd ~/Dev/raymania/"



