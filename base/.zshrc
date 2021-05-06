# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="eike"

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
plugins=(history git pip)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

export VISUAL="nvim"
export EDITOR="nvim"
export QT_LOGGING_RULES="qt5ct.debug=false"
export _JAVA_OPTIONS="-Dawt.useSystemAAFontSettings=gasp"
export PAGER="less -j4"
export PIP_REQUIRE_VIRTUALENV=true

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias less="less -j4"
alias mv="mv -i"
alias grep="grep --colour"
alias l="ls -lhH --color=auto --group-directories-first"
alias ll="l -a"
alias l1="\\ls -1"
alias sudoedit="sudoedit -E"
alias vim="nvim"
alias v="vim"
alias vd="vim -d"
alias sv="sudo -E nvim"
alias svd="sv -d"
alias feh="feh -d -. --keep-zoom-vp"
alias nl="nl -b a -f a -h a"

alias pm="podman"
alias pmi="podman image"
alias pmv="podman volume"
alias pmc="podman container"
alias pmp="podman pod"
alias spm="sudo podman"
alias spmi="sudo podman image"
alias spmv="sudo podman volume"
alias spmc="sudo podman container"
alias spmp="sudo podman pod"

function xo { for file in $@; do xdg-open $file &> /dev/null &!; done }
function xop { for file in $@; do xdg-open $file &!; done }

alias env_esp="export PATH=\"\$PATH:/opt/esp8266/toolchain/bin\"; export IDF_PATH=/opt/esp8266/sdk"

cdgit() { cd `git rev-parse --show-toplevel`; }

# Vim colorscheme correction
# source ~/.config/nvim/plugins/gruvbox/gruvbox_256palette.sh

HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt autocd nomatch
