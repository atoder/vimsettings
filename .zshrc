# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
#
# php7 path so vim uses proper php parser when looking at php7 syntax
# for installation use https://php-osx.liip.ch/
# php-osx doesn't overwrite the php binaries installed by Apple, but installs everything in /usr/local/php5.
# The new php binary is therefore in /usr/local/php5/bin/php.
# You can also adjust your PATH do include that directory, eg. write into your ~/.profile file the following

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
#export TERM="xterm-256color"
setopt CORRECT


# make sure that if a program wants you to edit
# # text, that Vim is going to be there for you
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

#tiny-care-terminal settings
# List of accounts to read the last tweet from, comma separated
# The first in the list is read by the party parrot.
export TTC_BOTS='tinycarebot,selfcare_bot,tinycarebot'

# List of folders to look into for `git` commits, comma separated.
export TTC_REPOS='~'

#TTC_SAY_BOX = parrot | bunny | llama | cat | yeoman | mario | ironman | minions | panda
export TTC_SAY_BOX='bunny'
#export TTC_SAY_BOX='llama'

# The max directory-depth to look for git repositories in
# the directories defined with `TTC_REPOS`. Note that the deeper
# the directory depth, the slower the results will be fetched.
export TTC_REPOS_DEPTH=8

# Which method is to be used to read the git commits ('gitstandup' | 'gitlog').
# If you're having problems seeing your commits in the dahsboard, set
# this value to gitlog.
export TTC_GITBOT='gitlog'

# F mode on
export TTC_CELSIUS=false

# Location/zip code to check the weather for. Both 90210 and "San Francisco, CA"
# _should_ be ok (the zip code doesn't always work -- use a location
# first, if you can). It's using weather.service.msn.com behind the curtains.
export TTC_WEATHER='95014'

# Unset this if you _don't_ want to use Twitter keys and want to
# use web scraping instead.
export TTC_APIKEYS=false

# Refresh the dashboard every 20 minutes.
export TTC_UPDATE_INTERVAL=20

# Turn off terminal title
export TTC_TERMINAL_TITLE=false

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="awesomepanda"
#ZSH_THEME="random"
#ZSH_THEME="kolo"
#ZSH_THEME="cloud"
#ZSH_THEME="sammy"
#ZSH_THEME="minimal"
#ZSH_THEME="fino"
#ZSH_THEME="simple"
#ZSH_THEME="wezm"
#ZSH_THEME="agnoster"
#ZSH_THEME="af-magic"



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
plugins=(git zsh-completions zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh
source $ZSH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


alias rm="echo Use 'trash' app to move files into trash. If you really need rm, use the full path i.e. '/bin/rm'"



# optionally set DEFAULT_USER in ~/.zshrc to your regular username to hide the “user@hostname” info when you’re logged in as yourself on your local machine for 'agnoster' theme
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    #prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# disables right promp name for af-magic
#RPROMPT='%F{black}$USER'
#RPROMPT=''

# Vim mode
bindkey -v


# START OF VIM INSERT VS COMMAND MODE
# perform parameter expansion/command substitution in prompt
setopt PROMPT_SUBST

vim_ins_mode="[INS]"
vim_cmd_mode="[CMD]"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish
#RPROMPT='${vim_mode}'
#show vim mode and time

RPROMPT='${vim_mode}%t'

# END OF VIM INSERT VS COMMAND MODE

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/atoder/.sdkman"
[[ -s "/Users/atoder/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/atoder/.sdkman/bin/sdkman-init.sh"


# Prepands money back emoji to the prompt
#PROMPT='👁️  '$PROMPT
#PROMPT+='🔥  '

# This is GOLD for finding out what is taking so much space on your drives!
alias diskspace="du -h | sort -n -r |more"

# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -hs | sort -rn"

ctags=/usr/local/bin/ctags

# https://github.com/bhilburn/powerlevel9k
# https://medium.freecodecamp.org/how-you-can-style-your-terminal-like-medium-freecodecamp-or-any-way-you-want-f499234d48bc

# Customise the Powerlevel9k prompts
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
#  custom_medium custom_freecodecamp dir vcs newline status
#)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=()
#POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
## Add the custom Medium M icon prompt segment
#POWERLEVEL9K_CUSTOM_MEDIUM="echo -n $'\uF859'"
#POWERLEVEL9K_CUSTOM_MEDIUM_FOREGROUND="black"
#POWERLEVEL9K_CUSTOM_MEDIUM_BACKGROUND="white"
## Add the custom freeCodeCamp prompt segment
#POWERLEVEL9K_CUSTOM_FREECODECAMP="echo -n $'\uE242'"
#POWERLEVEL9K_CUSTOM_FREECODECAMP_FOREGROUND="white"
#POWERLEVEL9K_CUSTOM_FREECODECAMP_BACKGROUND="cyan"
## Load Nerd Fonts with Powerlevel9k theme for Zsh
#POWERLEVEL9K_MODE='nerdfont-complete'
#source ~/powerlevel9k/powerlevel9k.zsh-theme
#
## Set a color for iTerm2 tab title background using rgb values
#function title_background_color {
#  echo -ne "\033]6;1;bg;red;brightness;$ITERM2_TITLE_BACKGROUND_RED\a"
#  echo -ne "\033]6;1;bg;green;brightness;$ITERM2_TITLE_BACKGROUND_GREEN\a"
#  echo -ne "\033]6;1;bg;blue;brightness;$ITERM2_TITLE_BACKGROUND_BLUE\a"
#}
#ITERM2_TITLE_BACKGROUND_RED="18"
#ITERM2_TITLE_BACKGROUND_GREEN="26"
#ITERM2_TITLE_BACKGROUND_BLUE="33"
#title_background_color
## Set iTerm2 tab title text
#function title_text {
#    echo -ne "\033]0;"$*"\007"
#}
#title_text freeCodeCamp

# gem install lc
alias l="colorls -la"

# See also https://github.com/Falkor/dotfiles/blob/master/oh-my-zsh/
# Font taken from https://github.com/stefano-meschiari/dotemacs/blob/master/SourceCodePro%2BPowerline%2BAwesome%2BRegular.ttf
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

# configure clang
CC="clang"
CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
LDLIBS="-lcrypt -lcs50 -lm"
export LIBRARY_PATH=/usr/local/lib
export C_INCLUDE_PATH=/usr/local/include

function make50 { gcc "$1".c -o "$1" -I /usr/local/include -L /usr/local/lib -lcs50; }
alias python=/usr/local/bin/python3
alias pip=pip3
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
