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

To install YouComplete with c type languages

```
./install.py --clang-completer --js-completer
```

To install all

```
./install.py --all
```

2 ways to set up JavaScript completition.
1) Have a .tern-project file in your project directory or above with settings below
or
2) Global file in home directory
I prefer global

```
~/.tern-config
```
and put this into it
```
{
  "ecmaVersion": 6,
  "libs": [
    "browser",
    "ecma5",
    "ecma6",
    "browser",
    "jquery",
    "underscore",
    "chai"
  ],
  "plugins": {
    "modules": {},
    "es_modules": {},
    "node": {},
    "doc_comment": {
      "fullDocs": true,
      "strong": true
    }
  }
}

```

Now you can do the following in JavaScript

```
Intelligent auto-completion
Renaming variables (:YcmCompleter RefactorRename <new name>)
Go to definition, find references (:YcmCompleter GoToDefinition, :YcmCompleter GoToReferences)
Type information for identifiers (:YcmCompleter GetType)
View documentation comments for identifiers (:YcmCompleter GetDoc)
Management of Tern server instance
```

To get tern_for_vim working run

```
Intelligent auto-completion
cd ~/.vim/bundle/tern_for_vim
npm install 
```

and now can use

```
TernDef: Jump to the definition of the thing under the cursor.

TernDoc: Look up the documentation of something.

TernType: Find the type of the thing under the cursor.

TernRefs: Show all references to the variable or property under the cursor.

TernRename: Rename the variable under the cursor.
```
