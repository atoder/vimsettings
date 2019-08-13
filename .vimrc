" For Mac OS X, use Karabiner app to remap ESC to Caps Lock
" It's easier to use than hitting ESC key


" enter the current millenium
set nocompatible

" enable syntax and plugins (for netrw)
syntax enable
filetype plugin on

" show numbers
set number
set relativenumber

" 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set ignorecase

" removes newline EOL
" so other non vim/terminal editors don't see extra line
set binary
set noeol

"spaces instead of tab, must be after binary and noel setting
set expandtab


" Control + C mapping to run :bp | bd #
" which moves to previous buffer and closes the buffer we just moved from
" this way you can close a buffer and still have a vsplit for example
nnoremap <C-c> :bp\|bd #<CR>

" yy will not just use internal vim buffer but will also copy
" into OS's clipboard
set clipboard=unnamed

"set termguicolors

autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab

au BufNewFile,BufRead *.ejs set filetype=javascript
au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead *.eco set filetype=html


"mapping buffer switching and closing to shortcuts
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" map leader is a space in this case
" can now hit space ss to save session for example
let mapleader = " "

"Encoding must be set to UTF-8 for the glyphs to show
set encoding=utf8
set fileencoding=utf8

" Easier buffer switching
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9


" Switch to last active buffer
noremap <leader>b :buffer #<CR>

" Allow mouse to scroll the vim windows and resize splits
set mouse=a

"Allow mouse to resize splits when vim is inside tmux
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

highlight Comment cterm=italic gui=italic

"Enable HTML attributes to be italic
highlight htmlArg cterm=italic gui=italic

"Enable HTML italic highlight
highlight htmlItalic cterm=italic gui=italic


"This results in the character being highlighted in magenta (the screenshot is
"in DarkCyan) when the line goes over the 80-character maximum.
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif



" FINDING FILES:

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


" TAG JUMPING:

" Create the `tags` file (may need to install ctags first)
command! MakeTags !ctags -R .

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" THINGS TO CONSIDER:
" - This doesn't help if you want a visual list of tags



" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list



" FILE BROWSING:

" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
"let g:netrw_browse_split=4  " open in prior window
let g:netrw_browse_split=0  " reuse the same window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'



" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings



" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"For commenting and uncommenting blocks of line
Plugin 'scrooloose/nerdcommenter'
"Comment out the current line or text selected in visual mode.
"[count]<leader>cc |NERDComComment|
"Uncomments the selected line(s).
"[count]<leader>cu |NERDComUncommentLine|
"Comments out the selected lines with a pretty block formatted layout.
"[count]<leader>cs |NERDComSexyComment|

Plugin 'christoomey/vim-tmux-navigator'

"Easy switching between buffers - vim-airline will show buffer at the top
"unless multiple tabs are open
Plugin 'bling/vim-airline'
" airline Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#enabled                      = 1
let g:airline#extensions#tabline#buffer_idx_mode              = 1
"let g:airline#extensions#tabline#show_buffers                 = 1
"let g:airline#extensions#tabline#buffer_min_count             = 1
"let g:airline#extensions#tabline#tab_min_count                = 1
"let g:airline#extensions#branch#enabled                       = 1
"let g:airline#extensions#tagbar#enabled                       = 0




"tags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

" ----- xolox/vim-easytags settings -----
"set tags=~/Sites/tags
"let g:easytags_events = ['BufReadPost', 'BufWritePost']
"let g:easytags_async = 1
"let g:easytags_dynamic_files = 2
"let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1

""A fancy start screen for Vim.
Plugin 'mhinz/vim-startify'

"" git in vim
"" :GStatus
"" :Gwrite
"" :Gcommit
Plugin 'tpope/vim-fugitive'

""Vim Better Whitespace Plugin
"":ToggleWhitespace
"": StripWhitespace
Plugin 'ntpeters/vim-better-whitespace'

"Automatic folds (that is, folds generated by a fold method different
"from manual), bog down VIM noticeably in insert mode.
"They are also often recomputed too early (for example, when inserting an
"opening fold marker whose closing counterpart is yet missing to complete
"the fold.)
Plugin 'Konfekt/FastFold'

"FastFold integrates with the plug-in vim-stay that restores the folds of
"a file buffer by :mkview and :loadview.
Plugin 'kopischke/vim-stay'

"syntax cheker
Plugin 'scrooloose/syntastic'

"vim javascript
Plugin 'pangloss/vim-javascript'

" silver surfer search text ack bundle
Plugin 'ggreer/the_silver_searcher'
Plugin 'rking/ag.vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
