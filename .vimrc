set nocompatible
filetype off    " Required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

"Amazing code completion
Plugin 'Valloric/YouCompleteMe'
"This is a Vim plugin that provides Tern-based JavaScript editing support.
Plugin 'marijnh/tern_for_vim'

" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview


Plugin 'flazz/vim-colorschemes'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'

"supertab
Bundle 'ervandew/supertab'

"Easy switching between buffers - vim-airline will show buffer at the top
"unless multiple tabs are open
Plugin 'tpope/vim-unimpaired'

"CoffeeScript support to vim
Plugin 'kchmck/vim-coffee-script'

"Provides an overview of the structure of source code files
Plugin 'majutsushi/tagbar'

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
"let g:solarized_termcolors = 16

" solarized options
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
"let g:solarized_contrast = "normal"
let g:solarized_termtrans = 1

colorscheme solarized
"colorscheme railscasts
"colorscheme wombat256

set background=dark
"set background=light
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
set paste

"removes newline EOL
"so other non vim/terminal editors don't see extra line
set binary
set noeol
"spaces instead of tab, must be after binary and noel setting
set expandtab

autocmd Filetype html setlocal ts=4 sts=4 sw=4
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=4 sts=4 sw=4
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

au BufNewFile,BufRead *.ejs set filetype=javascript

"show status at the bottom of vim file
set laststatus=2

"tail of the filename
set statusline=%f


"mapping buffer switching and closing to shortcuts
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>
"ALSO BELOW are shortcuts from vim-unimpared plugin
" JUST REFERENCE BELOW
"[b     |:bprevious|
"]b     |:bnext|
"[B     |:bfirst|
" --- END REFERENCE

"airline Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" power fonts
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'


"CtrlP finding files
" Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
" When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable:
let g:ctrlp_working_path_mode = 'ra'


"vim-unimpaired shortcuts
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

"Tell NERDTree not to use the fancy arrow characters, by adding, otherwise arrows in NerdTree will look weird
let g:NERDTreeDirArrows=0

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" NERDTree with Ctrl+n (you can set whatever key you want):
map <C-n> :NERDTreeToggle<CR>

"my own defined shortcut  display all class methods and source code structure
"for tag bar
nmap <C-o> :TagbarToggle<CR>


"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


"vim sessions
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"vim sessionc custom mapping
" can now hit space ss to save session for example

let mapleader = " " "this is space
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSesssion<CR>


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
noremap <leader><space> :buffer #<CR>


let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"space st will enable and disable syntastic
nmap <leader>st :SyntasticToggleMode<CR>



"put away all .swp files into home dir instead of cluttering up in your projects
set swapfile
set dir=~/tmp

"gets rid of possibly useless use of a variable in void context error
"let g:syntastic_eruby_ruby_quiet_messages =  {'regex': 'possibly useless use of a variable in void context'}

" get rid of syntastic warning for ejs and javascript files
" let g:syntastic_mode_map={ 'mode': 'active',
"                     \ 'active_filetypes': [],
"                     \ 'passive_filetypes': ['html'] }

" JavaScript
let javascript_enable_domhtmlcss = 1
