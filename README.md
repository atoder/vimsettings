# My VIM settings


## Favorite Fonts
1. Comic Mono
2. Operator Mono Lig
3. MonoLisa
4. Gintronic
5. Recursive Mono
6. NovaMoto
7. Cascadia Code
8. Hermit
9. Fantasque
10. Inconsolata
11. JetBrains Mono
12. SpaceMono


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

# BELOW IS OLD SET UP

## Syntastic using JSHint to support es6 (OLD - use .eslintrc instead above)
https://stackoverflow.com/questions/20160921/syntastic-complaining-about-es6-module-syntax


Create .jshintrc file in your project or parent directory
```
{
  "esversion": 6
}
```

## YouComplete C error checking

in ~/.vimrc you should already have 

```
let g:ycm_global_ycm_extra_conf = "$HOME/.ycm_extra_conf.py"
```

```
import os
import ycm_core

flags = [
  '-Wall',
  '-Wextra',
  '-Werror',
  '-Wno-long-long',
  '-Wno-variadic-macros',
  '-fexceptions',
  '-ferror-limit=10000',
  '-DNDEBUG',
  '-std=c99',
  '-xc',
  '-isystem/usr/include/',
  ]

SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', ]

def FlagsForFile( filename, **kwargs ):
  return {
  'flags': flags,
  'do_cache': True
  }

```

If you're using c++, add a 'c++' flag instead of 'c'
or 'objective-c' for objective c


https://github.com/Valloric/YouCompleteMe#mac-os-x

To install all go to youcomplete vim directory

```
cd ~/.vim/bundle/YouCompleteMe
```

```
./install.py --all
```

To install YouComplete only with C type languages and Java

```
./install.py --clang-completer --java-completer

```







All JavaScript and TypeScript features are provided by the TSServer engine, which is included in the TypeScript SDK. To get the SDK, install Node.js and npm and run the command:

```
npm install -g typescript

```
TSServer relies on the jsconfig.json file for JavaScript and the tsconfig.json file for TypeScript to analyze your project. Ensure the file exists at the root of your project.

To get diagnostics in JavaScript, set the checkJs option to true in your jsconfig.json file:
and also to allow JSX in javascript files

```
{
    "compilerOptions": {
        "checkJs": true,
         "moduleResolution": "node",
         "target": "es6",
         "jsx": "react",

    },
}
```

Put this file into your project directory and add it to .gitignore 
or you can also put this file into parent directory

