# ==============================================================================
# Oh-My-ZSH
#
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
plugins=(git colored-man-pages colorize zsh-syntax-highlighting)

# User configuration
source $ZSH/oh-my-zsh.sh


# ==============================================================================
# Common export variables.
#
# export TERM=xterm-256color-italic

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export PATH="/usr/local/cuda/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
if [[ "$OSTYPE" == "Darwin*" ]]; then
  export PATH=${HOME}/nvim-osx64/bin:${PATH}
fi
# Use ccache aliases by default for C and C++ compilers.
export PATH=/usr/lib/ccache:${PATH}

export MANPATH="/usr/local/man:$MANPATH"

# Shared library paths.
if [[ "$(hostname)" == "kulen"   ||
      "$(hostname)" == "fractal" ]]; then
  export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:${LD_LIBRARY_PATH}
fi


# ==============================================================================
# Python environment.
export WORKON_HOME=${HOME}/virtualenvs

if [[ "$(hostname)" == "bokor" ||
      "$(hostname)" == "tatai" ]]; then
  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
  export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
  source /usr/local/bin/virtualenvwrapper.sh
elif [[ "$(hostname)" == "fractal" ]]; then
  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
  export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
  source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

  export PYTHONPATH=/usr/lib/python3.5/dist-packages:$PYTHONPATH
  export PYTHONPATH=/home/david/GitHub/HumanisingAutonomy/xlive_pipeline:$PYTHONPATH

  workon ha-python3
elif [[ "$(hostname)" == "kulen" ]]; then
  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python2
  export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/virtualenv
  source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

  workon docv-python3
elif [[ "$(hostname)" == "vihear" ]]; then
  export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
  export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
  source /usr/local/bin/virtualenvwrapper.sh

  workon docv-python3
fi


# ==============================================================================
# Preferred editor for local and remote sessions
#
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export EDITOR='vim'
elif [[ "$OSTYPE" == "darwin*" ]]; then
  export EDITOR='nvim';
elif [[ "$OSTYPE" == "msys" ]]; then
  export EDITOR='vim'
fi


# Colored output for GCC.
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Added by travis gem
[ -f /home/david/.travis/travis.sh ] && source /home/david/.travis/travis.sh

# For MacOSX
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# ==============================================================================
# Aliases
#
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  alias ls='ls --color=auto -FX --group-directories-first'
elif [[ "$OSTYPE" == "darwin*" ]]; then
  alias ls='gls --color=auto -FX --group-directories-first'
fi

# Add balzac.
export LD_LIBRARY_PATH=${HOME}/GitLab/DO-CV/sara-install/darwin-latest/usr/local/lib
export PYTHONPATH="${HOME}/GitHub/davidok8/balzac2:${HOME}/GitHub/davidok8/balzac2/app/modules"
if [[ "$OSTYPE" == "darwin*" ]]; then
  export PYTHONPATH="${HOME}/GitLab/DO-CV/sara-install/darwin-latest/usr/local/lib":${HOME}/GitLab/DO-CV/sara/python:${PYTHONPATH}
fi

alias cdsara='cd ${HOME}/GitLab/DO-CV/sara'
alias cdsararel='cd ${HOME}/GitLab/DO-CV/sara-build-Release'
alias cdsaradeb='cd ${HOME}/GitLab/DO-CV/sara-build-Debug'
alias cdsaraxcode='cd ${HOME}/GitLab/DO-CV/sara-build-Xcode'

alias vim='nvim'

# Balzac.
alias cdbalzac='cd ${HOME}/GitHub/davidok8/balzac2'
alias balzacsummary='CUDA_VISIBLE_DEVICES=1 \
  python ${HOME}/GitHub/davidok8/balzac2/app/schedule/core.py \
  --account=live --request_positions_summary'
alias mailkrousar='python \
  ${HOME}/GitHub/davidok8/krousar/porfolio_summary.py --send_email'
alias cronkrousar='python ${HOME}/GitHub/davidok8/krousar/porfolio_summary.py'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
