set nocompatible
filetype off    " Required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'    

"supertab
Bundle 'ervandew/supertab'

"Provides an overview of the structure of source code files 
Bundle 'vim-scripts/taglist.vim'

"color scheme
Bundle 'altercation/vim-colors-solarized'

"Lean & mean status/tabline for vim that's light as air.
Bundle 'bling/vim-airline'

"railcasts color scheme
Bundle 'jpo/vim-railscasts-theme'

"find files
Bundle 'kien/ctrlp.vim'

"syntax cheker
Bundle 'scrooloose/syntastic'

" silver surfer search text ack bundle
Bundle 'ggreer/the_silver_searcher'
Bundle 'rking/ag.vim'

"Nerd Tree collapse window
Bundle 'scrooloose/nerdtree'

"tags
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'

"vim sessions
Bundle 'xolox/vim-session'

"vim ruby
Bundle 'vim-ruby/vim-ruby'

"vim javascript
Bundle "pangloss/vim-javascript"

filetype plugin indent on 

" Some settings to enable the theme:
" Show line numbers
set number       

" Use syntax highlighting
syntax enable     
"let g:solarized_termcolors = 256
"let g:solarized_termcolors=16

" solarized options 
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
"let g:solarized_termtrans = 1

colorscheme solarized
"colorscheme railscasts


set background=dark
set history=700
set wildmenu"Turn on WiLd menu
set ruler
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set smarttab
set lbr
set tw=500
set ai 
set si
set nowrap
set number
syntax on
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
autocmd Filetype html setlocal ts=4 sts=4 sw=4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=4 sts=4 sw=4


"show status at the bottom of vim file
set laststatus=2

"tail of the filename
set statusline=%f 

"CtrlP finding files
" Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable:
let g:ctrlp_working_path_mode = 'ra'


let g:ackprg = 'ag --nogroup --nocolor --column'

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"Tell NERDTree not to use the fancy arrow characters, by adding, otherwise arrows in NerdTree will look weird
let g:NERDTreeDirArrows=0

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" NERDTree with Ctrl+n (you can set whatever key you want):
map <C-n> :NERDTreeToggle<CR>

"my own defined shortcut  display all class methods and source code structure
map <C-l> :TlistToggle<CR>


"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"vim sessions
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"vim sessionc custom mapping
" can now hit ,ss to save session for example
let mapleader = ","
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSesssion<CR>

"put away all .swp files into home dir instead of cluttering up in your projects
set swapfile
set dir=~/tmp

"gets rid of possibly useless use of a variable in void context error
let g:syntastic_eruby_ruby_quiet_messages =  {'regex': 'possibly useless use of a variable in void context'}

" get rid of syntastic warning for ejs and javascript files
" let g:syntastic_mode_map={ 'mode': 'active',
"                     \ 'active_filetypes': [],
"                     \ 'passive_filetypes': ['html'] }

" JavaScript
let javascript_enable_domhtmlcss = 1

" html binding works way better
au BufNewFile,BufRead *.ejs set filetype=html

