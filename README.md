# My VIM settings


Upload the ```.vimrc, .tmux.conf, .zshrc``` to an online code repository in a directory called vimsettings. 
On Mac OSX/Linux create symbolic links:

$ ln -s  ~/Documents/vimsettings/.vimrc $HOME/.vimrc

$ ln -s  ~/Documents/vimsettings/.tmux.conf $HOME/.tmux.conf

$ ln -s  ~/Documents/vimsettings/.zshrc $HOME/.zshrc

$ ln -s  ~/Documents/vimsettings/.ycm_extra_conf.py $HOME/.ycm_extra_conf.py

##
For zsh-completions in zshell

```
git clone https://github.com/zsh-users/zsh-completions ~/.oh-my-zsh/custom/plugins/zsh-completions
```

Also install macvim and
```
alias vim='mvim -v'
```

Do brew install

```
brew install reattach-to-user-namespace
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




## Favorite Fonts
1. Recursive Mono
2. Comic Mono
3. Operator Mono Lig
4. MonoLisa
5. Gintronic
6. NovaMoto
7. Cascadia Code
8. Hermit
9. Fantasque
10. Inconsolata
11. JetBrains Mono
12. SpaceMono
