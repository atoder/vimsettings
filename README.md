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
(javascript and c++ setting below)

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
 },
 "languageserver": {
   "ccls": {
     "command": "ccls",
     "filetypes": [
       "c",
       "cpp",
       "objc",
       "objcpp"
     ],
     "rootPatterns": [
       ".ccls",
       "compile_commands.json",
       ".vim/",
       ".git/",
       ".hg/"
     ],
     "initializationOptions": {
       "cache": {
         "directory": "/tmp/ccls"
       },
       "clang": {
         // make sure you have installed commandLineTools
         "resourceDir": "/Library/Developer/CommandLineTools/usr/lib/clang/11.0.3",
         "extraArgs": [
           "-isystem",
           "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1",
           "-I",
           "/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include/"
         ]
       }
     }
   }
 }
}
```

For debugging in vimspector, you need to have the following file in your directory
```.vimspector.json```

Debugging c++
where main is the compiled c++ file 

Debugging node js
and simple.js is node js file

Make sure to run ```:VimspectorInstall``` and install appropriate debuggers


```
{
  "configurations": {
    "run node" : {
      "adapter": "vscode-node",
      "configuration": {
        "request":"launch",
        "protocol": "auto",
        "stopOnEntry":true,
        "console":"integratedTerminal",
        "program": "${workspaceFolder}/simple.js",
        "cwd": "${workspaceFolder}/"
      }
    },
    "run g++" : {
      "adapter": "vscode-cpptools",
      "configuration": {
        "request":"launch",
        "protocol": "auto",
        "stopOnEntry":true,
        "console":"integratedTerminal",
        "program": "${workspaceFolder}/main",
        "cwd": "${workspaceFolder}/",
        "breakpoints": {
           "exception": {
             "cpp_throw": "Y",
             "cpp_catch": "Y"
           }
         },
         "MImode": "lldb"
      }
    }
  }
}
```

Also make sure that when you compile C++ files you use the flags -g
```
-g 
```

```
-g -O0
```

Example

```
g++ -g -O2 main.cpp -o main
```

## LLVM 

```
brew install llvm
brew link llvm
Warning: Refusing to link macOS provided/shadowed software: llvm
If you need to have llvm first in your PATH run:
  echo 'export PATH="/usr/local/opt/llvm/bin:$PATH"' >> ~/.zshrc

For compilers to find llvm you may need to set:
  export LDFLAGS="-L/usr/local/opt/llvm/lib"
  export CPPFLAGS="-I/usr/local/opt/llvm/include"
```

## coc-explorer 
Vim window that shows files on the left side

Run ```:CocInstall coc-explorer```


## other
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
1. DM Mono
2. Iosevka
3. Recursive Mono / Rec Mono Casual
4. MonoLisa
5. Gintronic
6. Cascadia Code
7. Firicico
8. Operator Mono Lig
9. SpaceMono
10. Comic Mono
11. NovaMoto
12. Hermit
13. Fantasque
14. JetBrains Mono
15. SF Mono Regular
16. Inconsolata
17. Source Code Pro


For fonts icons to display in tmux, use a secondary Non-ASCII font such as
1. Hack Nerd Front Mono


## Window Manager
[Rectangle](https://github.com/rxhanson/Rectangle)


## Tmuxinator
https://github.com/tmuxinator/tmuxinator
=======

## Lynx Browser

Find the lynx config
`/usr/local/etc/lynx.cfg`


Change these settings
```
ACCEPT_ALL_COOKIES:TRUE
VI_KEYS_ALWAYS_ON:TRUE
```


## C++ setup + library
Very good article https://ianding.io/2019/07/29/configure-coc-nvim-for-c-c++-development/


For competitive coding, people use `# include <bits/stdc++.h>` library
On Mac OS X, you should create bits folder with file stdc++.h in `/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include/c++/v1` directory

```stdc++.h``` file contents

```
// C++ includes used for precompiling -*- C++ -*-

// Copyright (C) 2003-2013 Free Software Foundation, Inc.
//
// This file is part of the GNU ISO C++ Library.  This library is free
// software; you can redistribute it and/or modify it under the
// terms of the GNU General Public License as published by the
// Free Software Foundation; either version 3, or (at your option)
// any later version.

// This library is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.

// Under Section 7 of GPL version 3, you are granted additional
// permissions described in the GCC Runtime Library Exception, version
// 3.1, as published by the Free Software Foundation.

// You should have received a copy of the GNU General Public License and
// a copy of the GCC Runtime Library Exception along with this program;
// see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
// <http://www.gnu.org/licenses/>.

/** @file stdc++.h
 *  This is an implementation file for a precompiled header.
 */

// 17.4.1.2 Headers

// C
#ifndef _GLIBCXX_NO_ASSERT
#include <cassert>
#endif
#include <cctype>
#include <cerrno>
#include <cfloat>
#include <ciso646>
#include <climits>
#include <clocale>
#include <cmath>
#include <csetjmp>
#include <csignal>
#include <cstdarg>
#include <cstddef>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <ctime>

#if __cplusplus >= 201103L
#include <ccomplex>
#include <cfenv>
#include <cinttypes>
#include <cstdbool>
#include <cstdint>
#include <ctgmath>
#include <cwchar>
#include <cwctype>
#endif

// C++
#include <algorithm>
#include <bitset>
#include <complex>
#include <deque>
#include <exception>
#include <fstream>
#include <functional>
#include <iomanip>
#include <ios>
#include <iosfwd>
#include <iostream>
#include <istream>
#include <iterator>
#include <limits>
#include <list>
#include <locale>
#include <map>
#include <memory>
#include <new>
#include <numeric>
#include <ostream>
#include <queue>
#include <set>
#include <sstream>
#include <stack>
#include <stdexcept>
#include <streambuf>
#include <string>
#include <typeinfo>
#include <utility>
#include <valarray>
#include <vector>

#if __cplusplus >= 201103L
#include <array>
#include <atomic>
#include <chrono>
#include <condition_variable>
#include <forward_list>
#include <future>
#include <initializer_list>
#include <mutex>
#include <random>
#include <ratio>
#include <regex>
#include <scoped_allocator>
#include <system_error>
#include <thread>
#include <tuple>
#include <typeindex>
#include <type_traits>
#include <unordered_map>
#include <unordered_set>
#endif
```
