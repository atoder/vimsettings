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
"Supertab is a vim plugin which allows you to use <Tab> for all your
"insert completion needs
Bundle 'ervandew/supertab'


" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview


" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

Plugin 'flazz/vim-colorschemes'

Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'

"Automatic close for common block and scope identifiers such as brackets
" parentheses, brace, squares
"https://github.com/jiangmiao/auto-pairs
"Something I’ve found to be very useful, which doesn’t require any bundles other than delimitMate really,
"is to add a key binding that will split my current line.
" So if I type {, delimitMate will insert } after my cursor, then I can execute my
" binding that will insert a new line in the middle of the two ready to receive some code.
Plugin 'Raimondi/delimitMate'
"Just hit control C and it will move the closing bracket down
imap <C-c> <CR><Esc>O
"<C-g>g mapping. CTRL+g g will put you after the matching bracket

"CoffeeScript support to vim
Plugin 'kchmck/vim-coffee-script'

"Provides an overview of the structure of source code files
"Lean & mean status/tabline for vim that's light as air.
Plugin 'majutsushi/tagbar'

"color scheme
Bundle 'altercation/vim-colors-solarized'

"Easy switching between buffers - vim-airline will show buffer at the top
"unless multiple tabs are open
Bundle 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"railcasts color scheme
Bundle 'jpo/vim-railscasts-theme'


"New ctrlp
Bundle 'ctrlpvim/ctrlp.vim'

"syntax cheker
Bundle 'scrooloose/syntastic'

" silver surfer search text ack bundle
Bundle 'ggreer/the_silver_searcher'
Bundle 'rking/ag.vim'

"Nerd Tree collapse window
Bundle 'scrooloose/nerdtree'
" font icons for different file extensions in NerdTree
" Install fonts for vim-devicons from https://github.com/ryanoasis/nerd-fonts
Plugin 'ryanoasis/vim-devicons'
"Encoding must be set to UTF-8 for the glyphs to show
set encoding=utf8

"tags
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-easytags'

"vim sessions
Bundle 'xolox/vim-session'

"vim ruby
Bundle 'vim-ruby/vim-ruby'

"vim javascript
Bundle "pangloss/vim-javascript"

"From http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
Plugin 'jelera/vim-javascript-syntax'
"Indent Guides is a plugin for visually displaying indent levels in Vim.

Plugin 'nathanaelkane/vim-indent-guides'
"to enable type mapleader (in my case space) and ig

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
"let g:solarized_termtrans = 1

Plugin 'crusoexia/vim-monokai'
"colorscheme monokai
"set t_Co=256  " vim-monokai now only support 256 colours in terminal."

colorscheme solarized
"colorscheme railscasts
"colorscheme wombat256
"

"Auto indent cod
set autoindent

"Switch between different backgrounds
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
"set paste

"removes newline EOL
"so other non vim/terminal editors don't see extra line
set binary
set noeol
"spaces instead of tab, must be after binary and noel setting
set expandtab

autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab

au BufNewFile,BufRead *.ejs set filetype=javascript
au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead *.eco set filetype=html

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

"NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

au VimEnter * call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
au VimEnter * call NERDTreeHighlightFile('handlebars', 'green', 'none', 'green', '#151515')
au VimEnter * call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
au VimEnter * call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
au VimEnter * call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
au VimEnter * call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
au VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
au VimEnter * call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
au VimEnter * call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


