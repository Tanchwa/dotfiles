# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

fastfetch

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="gnzh"
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_MODE="nerdfont-matched"


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_mac_icon dir vcs)

POWERLEVEL9K_CUSTOM_MAC_ICON="echo "
POWERLEVEL9K_CUSTOM_MAC_ICON_BACKGROUND=108
POWERLEVEL9K_CUSTOM_MAC_ICON_FOREGROUND=223

POWERLEVEL9K_CUSTOM_UBUNTU_ICON="echo "
POWERLEVEL9K_CUSTOM_UBUNTU_ICON_BACKGROUND=108
POWERLEVEL9K_CUSTOM_UBUNTU_ICON_FOREGROUND=223

POWERLEVEL9K_DIR_HOME_BACKGROUND=239
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=239
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND=239
POWERLEVEL9K_DIR_HOME_FOREGROUND=223
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=223
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=223

POWERLEVEL9K_VCS_CLEAN_FOREGROUND=223
POWERLEVEL9K_VCS_CLEAN_BACKGROUND=106
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=223
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND=208
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=223
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=066

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(kubecontext status time)

POWERLEVEL9K_KUBECONTEXT_BACKGROUND=175
POWERLEVEL9K_KUBECONTEXT_FOREGROUND=235

POWERLEVEL9K_STATUS_ERROR_BACKGROUND=124
POWERLEVEL9K_STATUS_ERROR_FOREGROUND=214 #239

POWERLEVEL9K_TIME_BACKGROUND=208
POWERLEVEL9K_TIME_FOREGROUND=235

#POWERLEVEL9K_CUSTOM_SPOTIFY="echo ' $(spotify status | sed -n '2p;4p' | tr '\n' ' ')'"
#POWERLEVEL9K_CUSTOM_SPOTIFY_BACKGROUND=235
#POWERLEVEL9K_CUSTOM_SPOTIFY_FOREGROUND=106

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git terraform python macos git-prompt kube-ps1)


source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='nvim'
 else
   export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias k="kubectl"
alias nvim="nvim +NvimTreeOpen"
