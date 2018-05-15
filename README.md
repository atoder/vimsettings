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

for JavaScript tags
Create ~/.ctags

```
--exclude=node_modules
--exclude=gulp
--languages=-javascript
--langdef=js
--langmap=js:.js
--langmap=js:+.jsx
--regex-js=/[ \t.]([A-Z][A-Z0-9._$]+)[ \t]*[=:][ \t]*([0-9"'\[\{]|null)/\1/n,constant/
--regex-js=/\.([A-Za-z0-9._$]+)[ \t]*=[ \t]*\{/\1/o,object/
--regex-js=/['"]*([A-Za-z0-9_$]+)['"]*[ \t]*:[ \t]*\{/\1/o,object/
--regex-js=/([A-Za-z0-9._$]+)\[["']([A-Za-z0-9_$]+)["']\][ \t]*=[ \t]*\{/\1\.\2/o,object/
--regex-js=/([A-Za-z0-9._$]+)[ \t]*=[ \t]*\(function\(\)/\1/c,class/
--regex-js=/['"]*([A-Za-z0-9_$]+)['"]*:[ \t]*\(function\(\)/\1/c,class/
--regex-js=/class[ \t]+([A-Za-z0-9._$]+)[ \t]*/\1/c,class/
--regex-js=/([A-Za-z$][A-Za-z0-9_$()]+)[ \t]*=[ \t]*[Rr]eact.createClass[ \t]*\(/\1/c,class/
--regex-js=/([A-Z][A-Za-z0-9_$]+)[ \t]*=[ \t]*[A-Za-z0-9_$]*[ \t]*[{(]/\1/c,class/
--regex-js=/([A-Z][A-Za-z0-9_$]+)[ \t]*:[ \t]*[A-Za-z0-9_$]*[ \t]*[{(]/\1/c,class/
--regex-js=/([A-Za-z$][A-Za-z0-9_$]+)[ \t]*=[ \t]*function[ \t]*\(/\1/f,function/
--regex-js=/(function)*[ \t]*([A-Za-z$_][A-Za-z0-9_$]+)[ \t]*\([^)]*\)[ \t]*\{/\2/f,function/
--regex-js=/['"]*([A-Za-z$][A-Za-z0-9_$]+)['"]*:[ \t]*function[ \t]*\(/\1/m,method/
--regex-js=/([A-Za-z0-9_$]+)\[["']([A-Za-z0-9_$]+)["']\][ \t]*=[ \t]*function[ \t]*\(/\2/m,method/
--langdef=typescript
--langmap=typescript:.ts
--regex-typescript=/^[ \t]*(export)?[ \t]*class[ \t]+([a-zA-Z0-9_]+)/\2/c,classes/
--regex-typescript=/^[ \t]*(export)?[ \t]*module[ \t]+([a-zA-Z0-9_]+)/\2/n,modules/
--regex-typescript=/^[ \t]*(export)?[ \t]*function[ \t]+([a-zA-Z0-9_]+)/\2/f,functions/
--regex-typescript=/^[ \t]*export[ \t]+var[ \t]+([a-zA-Z0-9_]+)/\1/v,variables/
--regex-typescript=/^[ \t]*var[ \t]+([a-zA-Z0-9_]+)[ \t]*=[ \t]*function[ \t]*\(\)/\1/v,varlambdas/
--regex-typescript=/^[ \t]*(export)?[ \t]*(public|private)[ \t]+(static)?[ \t]*([a-zA-Z0-9_]+)/\4/m,members/
--regex-typescript=/^[ \t]*(export)?[ \t]*interface[ \t]+([a-zA-Z0-9_]+)/\2/i,interfaces/
--regex-typescript=/^[ \t]*(export)?[ \t]*enum[ \t]+([a-zA-Z0-9_]+)/\2/e,enums/
--regex-typescript=/^[ \t]*import[ \t]+([a-zA-Z0-9_]+)/\1/I,imports/
```

## Basic Ranger shortcuts

# ranger is a text-based file manager written in Python. Directories are displayed in one pane with three columns. Moving between them is accomplished with keystrokes, bookmarks, the mouse or the command history. File previews and directory contents show automatically for the current selection.
# Installation

```
brew install ranger
```

These are the basic key binds in ranger, even outside of my configs. Note that they are mostly vim-based.

```
h/j/k/l -- Move left/down/up/right (where left moves up in the directory structure, right moves into a folder)
Space -- select/highlight file
dd -- cut selected files
yy -- copy/yank selected files
pp -- paste/move cut/copied files
/ -- search, when (n/N) next/previos result
zh or CTRL-h -- show hidden files
Renaming files:
cw -- rename file from scratch
A -- rename file adding to the end
aa -- rename file appending before the extension
I -- rename file adding at the beginning
```
