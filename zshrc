# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="bullet-train"
BULLETTRAIN_CONTEXT_SHOW="true"
BULLETTRAIN_CONTEXT_BG="green"
BULLETTRAIN_CONTEXT_FG="white"
BULLETTRAIN_IS_SSH_CLIENT="true"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

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
plugins=(git zsh-syntax-highlighting zsh-history-substring-search zsh-autosuggestions)


# User configuration
source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export PATH="/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export PATH=/usr/lib/ccache:$PATH
#export PATH=/home/david/swift-5.1.1-RELEASE-ubuntu18.04/usr/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:${LD_LIBRARY_PATH}
# export MANPATH="/usr/local/man:$MANPATH"

# Python environment.
if [[ "$(hostname)" == "bokor" ||
      "$(hostname)" == "tatai" ]]; then
  export WORKON_HOME=${HOME}/virtualenvs
  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
  export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
  source /usr/local/bin/virtualenvwrapper.sh
elif [[ "$(hostname)" == "kulen" ]]; then
  export WORKON_HOME=${HOME}/virtualenvs
  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
  export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
  source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi
export PYTHONPATH="/home/david/GitHub/davidok8/balzac2:/home/david/GitHub/davidok8/balzac2/app/modules"


# Preferred editor for local and remote sessions
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export EDITOR='vim'
elif [[ "$OSTYPE" == "darwin*" ]]; then
  export EDITOR='mvim -v';
elif [[ "$OSTYPE" == "msys" ]]; then
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# SSH
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.y
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls='ls --color=auto -FX --group-directories-first'
elif [[ "$OSTYPE" == "darwin*" ]]; then
  alias ls='gls --color=auto -FX --group-directories-first'
fi

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# added by travis gem
[ -f /home/david/.travis/travis.sh ] && source /home/david/.travis/travis.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


alias gh='cd ${HOME}/GitHub'
alias gl='cd ${HOME}/GitLab'
alias cdsara='cd ${HOME}/GitHub/DO-CV/sara'
alias cdsarad='cd ${HOME}/GitHub/DO-CV/sara-build-Debug'
alias cdsarar='cd ${HOME}/GitHub/DO-CV/sara-build-Release'
alias cdbalzac='cd ${HOME}/GitHub/davidok8/balzac2'
alias androidstudio='${HOME}/android-studio/bin/studio.sh'

alias balzacsummary='CUDA_VISIBLE_DEVICES=1 \
  python ${HOME}/GitHub/davidok8/balzac2/app/schedule/core.py \
  --account=live --request_positions_summary'

alias mailkrousar='python \
  ${HOME}/GitHub/davidok8/krousar/porfolio_summary.py --send_email'
alias cronkrousar='python ${HOME}/GitHub/davidok8/krousar/porfolio_summary.py'

alias cling='/home/david/GitHub/cling-build/inst/bin/cling'

workon docv-python3
source /home/david/.cargo/env
