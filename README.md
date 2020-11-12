# My VIM settings


Upload the ```.vimrc, .tmux.conf, .zshrc``` to an online code repository in a directory called vimsettings.
On Mac OSX/Linux create symbolic links:

$ ln -s  ~/Documents/vimsettings/.vimrc $HOME/.vimrc

$ ln -s  ~/Documents/vimsettings/.tmux.conf $HOME/.tmux.conf

$ ln -s  ~/Documents/vimsettings/.zshrc $HOME/.zshrc

For VIM tmp file settings make sure to create tmp file

```
mkdir ~/tmp
```

##
For zsh shell stuff

```
brew install zsh
```

```
https://ohmyz.sh/
```

```
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```


```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

```
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
```

```
chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share/zsh/site-functions
```

Install macvim and
```
alias vim='mvim -v'
```

Trash Tool
```
brew install trash
```

```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```


To install Tmux Plugins in settings use
```
prefix + I (ctrl B + capital i)
```

Set up tmux italics
```
https://alexpearce.me/2014/05/italics-in-iterm2-vim-tmux/
```

There is a xterm-256-color-italic.terminfo
run
```
tic xterm-256-color-italic.terminfo
```

VIM uses coc.nvim plugin for auto completition. To have custom error and warning signs
type in :CocConfig and paste the settings below (also includes coc-explorer tree setting)

```
{
 "javascript.suggestionActions.enabled": true,
 "diagnostic.errorSign": "❌",
 "diagnostic.warningSign": "⚠️" ,
 "diagnostic.infoSign": "ℹ️",
 "diagnostic.hintSign": "•",

 "explorer.width": 30,
 "explorer.icon.enableNerdfont": true,
 "explorer.previewAction.onHover": false,
 "explorer.keyMappings.global": {
   "<cr>": ["expandable?", "expand", "open"],
   "v": "open:vsplit"
 }
}

```

and also run ```:CocInstall coc-explorer```



Do brew install

```
brew install reattach-to-user-namespace
```

Install fonts for vim-devicons from
```
https://github.com/ryanoasis/nerd-fonts
```

## External link
https://stackoverflow.com/questions/1031396/how-to-share-one-vimrc-file-among-multiple-clients

## Basic Ranger shortcuts
ranger is a text-based file manager written in Python. Directories are displayed in one pane with three columns. Moving between them is accomplished with keystrokes, bookmarks, the mouse or the command history. File previews and directory contents show automatically for the current selection.
# Installation

```
brew install ranger
ranger --copy-config=all
```

These are the basic key binds in ranger, even outside of my configs. Note that they are mostly vim-based.

```
h/j/k/l -- Move left/down/up/right (where left moves up in the directory structure, right moves into a folder)
Space -- select/highlight file
dd -- cut selected files
yy -- copy/yank selected files
pp -- paste/move cut/copied files
/ -- search, when (n/N) next/previous result
zh or CTRL-h -- show hidden files
Renaming files:
cw -- rename file from scratch
A -- rename file adding to the end
aa -- rename file appending before the extension
I -- rename file adding at the beginning
```

## .eslintrc
Create .eslintrc file in your project or parent directory
```
module.exports = {
  "env": {
    "browser": true,
    "es6": true,
    "node": true,
    "mocha": true
  },
  "extends": "eslint:recommended",
  "globals": {
    "Atomics": "readonly",
    "SharedArrayBuffer": "readonly"
  },
  "parserOptions": {
    "ecmaFeatures": {
      "jsx": true
    },
    "ecmaVersion": 2018,
    "sourceType": "module"
  },
  "plugins": [
    "react"
  ],
  "rules": {
  }
};
```




## Favorite Fonts Main Fonts (use ligatures in iterm2)
1. Recursive Mono / Rec Mono Casual
2. MonoLisa
3. Gintronic
4. Firicico
5. Comic Mono
6. DM Mono
7. Cascadia Code
8. Operator Mono Lig
9. NovaMoto
10. Hermit
11. Fantasque
12. Inconsolata
13. JetBrains Mono
14. SpaceMono

For fonts icons to display in tmux, use a secondary Non-ASCII font such as
1. Hack Nerd Front Mono


## Window Manager
[Rectangle](https://github.com/rxhanson/Rectangle)



## Lynx Browser

Find the lynx config
`/usr/local/etc/lynx.cfg`


Change these settings
```
ACCEPT_ALL_COOKIES:TRUE
```

