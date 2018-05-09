# My VIM settings

Upload the ```.vimrc, .tmux.conf, .zshrc``` to an online code repository in a directory called vimsettings. 
On Mac OSX/Linux create symbolic links:

$ ln -s  ~/Documents/vimsettings/.vimrc $HOME/.vimrc

$ ln -s  ~/Documents/vimsettings/.tmux.conf $HOME/.tmux.conf

$ ln -s  ~/Documents/vimsettings/.zshrc $HOME/.zshrc

## External link 
https://stackoverflow.com/questions/1031396/how-to-share-one-vimrc-file-among-multiple-clients

## YouComplete C error checking

in ~/.vimrc you should already have 

```
let g:ycm_global_ycm_extra_conf = "$HOME/.vim/.ycm_extra_conf.py"
```

and create the ~/.vim/.ycm_extra_conf.py file with the following content

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

./install.sh --clang-completer --system-libclang
To install YouComplete with c type languages

or

./install.sh --all
for all languages
