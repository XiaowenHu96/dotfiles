# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/home/xiaowen/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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
# NOTE: zsh-syntax-highlighting must be the last plugin referenced
# zsh-autosuggestions: git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-syntax-highlighting: git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
#
plugins=(
  git
  vi-mode
  zsh-autosuggestions
)
source $ZSH/oh-my-zsh.sh

# Remove vi-end-of-line since I dont like A to cause an autosuggestions
# was: ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=(forward-char end-of-line vi-forward-char vi-end-of-line vi-add-eol)
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=()
bindkey '^ ' autosuggest-accept

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

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
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH="/usr/local/bin:/usr/local/opt/bison/bin:/home/xiaowen/.gem/ruby/2.7.0/bin:/home/xiaowen/.local/bin:$PATH"
# Path to Go
export PATH=$PATH:/usr/local/go/bin
# Ghcup path
export PATH="$HOME/.cabal/bin:$HOME/.ghcup/bin:$PATH"
export PATH="/home/xiaowen/.ghcup/ghc/9.2.1/bin:$PATH"

autoload -Uz compinit
compinit
# Completion for kitty
# kitty + complete setup zsh | source /dev/stdin

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="/usr/local/opt/openssl/bin:$PATH"
export PATH="/usr/local/opt/sqlite/bin:$PATH"
# Solve gettext warning
export LC_ALL=en_US.UTF-8
export TERM='xterm-256color'
export EDITOR="/usr/local/bin/nvim"
# Start vim as server for vimtex backward search
export LD_LIBRARY_PATH=/usr/local/lib:$LD_LIBRARY_PATH

# Spark
export SPARK_HOME=/opt/apache-spark/

# Alias for lsd
# Note loading /etc/zsh/zshrc breaks theme and add unwatned alias
alias ls='lsd'
alias l='lsd -l'

# Alias for vimrc
alias vrc='nvim ~/.vimrc'
alias vimlsp='vim -u ~/souffle-lsp/vim-client/vimrc'

# Set up nvr server name
# export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket nvim

source /home/xiaowen/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /etc/profile.d/emscripten.sh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/xiaowen/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/xiaowen/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/xiaowen/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/xiaowen/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
#
alias vimdiff='nvim -d'

export PATH="/home/xiaowen/gcc-arm-non-eabi/gcc-arm-none-eabi-10.3-2021.10/bin:$PATH"
export CS140E_2022_PATH="/home/xiaowen/cs140e-22win/"
