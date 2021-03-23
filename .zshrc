# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
export SDKROOT="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk"
setopt CORRECT

# uses a different term when shing since remote machine won't have term-256color-italic
alias ssh='TERM=xterm-256color ssh'


# make sure that if a program wants you to edit
# # text, that Vim is going to be there for you
export EDITOR="vim"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

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


# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-completions zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

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

export TERM=xterm-256color-italic
export PATH="/usr/local/opt/llvm/bin:$PATH"
