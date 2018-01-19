set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"https://github.com/heavenshell/vim-jsdoc
"JSDOC for js
"To use it, hover over a function and type in :JSDoc
Plugin 'heavenshell/vim-jsdoc'

"Plugin for commenting and uncommenting blocks of line
Plugin 'scrooloose/nerdcommenter'
"Comment out the current line or text selected in visual mode.
"[count]<leader>cc |NERDComComment|
"
"
"Uncomments the selected line(s).
"[count]<leader>cu |NERDComUncommentLine|
"
"
"Comments out the selected lines with a pretty block formatted layout.
"[count]<leader>cs |NERDComSexyComment|
"

"Amazing code completion
Plugin 'Valloric/YouCompleteMe'

"This is a Vim plugin that provides Tern-based JavaScript editing support.
Plugin 'marijnh/tern_for_vim'

Plugin 'morhetz/gruvbox'

"Supertab is a vim plugin which allows you to use <Tab> for all your
"insert completion needs
Plugin 'ervandew/supertab'

Plugin 'flazz/vim-colorschemes'
"railcasts color scheme
Plugin 'jpo/vim-railscasts-theme'

"one dark color scheme
Plugin 'joshdick/onedark.vim'

Plugin 'chriskempson/base16-vim'

"color scheme
Plugin 'altercation/vim-colors-solarized'


Plugin 'christoomey/vim-tmux-navigator'

"do git in vim
":GStatus
":Gwrite
":Gcommit
Plugin 'tpope/vim-fugitive'

"Fugitive extension to manage and merge Git branches
":Merginal
Plugin 'idanarye/vim-merginal'

Plugin 'tpope/vim-unimpaired'



"Show which line changed since your last commit.
"GitGutterToggle
Plugin 'airblade/vim-gitgutter'

"Vim Better Whitespace Plugin
":ToggleWhitespace
": StripWhitespace
Plugin 'ntpeters/vim-better-whitespace'

" Easy align interactive
"" Just select and type Return then space. Type Return many type to change the
" alignments.
"
" If you want to align the second column, Return then 2 then space.
Plugin 'junegunn/vim-easy-align'
vnoremap <silent> <Enter> :EasyAlign<cr>

"Automatic close for common block and scope identifiers such as brackets
" parentheses, brace, squares
"https://github.com/jiangmiao/auto-pairs
"Something I’ve found to be very useful, which doesn’t require any bundles other than delimitMate really,
"is to add a key binding that will split my current line.
" So if I type {, delimitMate will insert } after my cursor, then I can execute my
" binding that will insert a new line in the middle of the two ready to receive some code.
Plugin 'Raimondi/delimitMate'

"Provides an overview of the structure of source code files
"Lean & mean status/tabline for vim that's light as air.
Plugin 'majutsushi/tagbar'

"Automatic folds (that is, folds generated by a fold method different from manual), bog down VIM noticeably in insert mode.
"They are also often recomputed too early (for example, when inserting an opening fold marker whose closing counterpart is yet missing to complete the fold.)
Plugin 'Konfekt/FastFold'

"FastFold integrates with the plug-in vim-stay that restores the folds of a file buffer by :mkview and :loadview.
Plugin 'kopischke/vim-stay'

"Easy switching between buffers - vim-airline will show buffer at the top
"unless multiple tabs are open
Plugin 'bling/vim-airline'

Plugin 'vim-airline/vim-airline-themes'

"New ctrlp
Plugin 'ctrlpvim/ctrlp.vim'

"syntax cheker
Plugin 'scrooloose/syntastic'

" silver surfer search text ack bundle
Plugin 'ggreer/the_silver_searcher'
Plugin 'rking/ag.vim'

"Nerd Tree collapse window
Plugin 'scrooloose/nerdtree'
" font icons for different file extensions in NerdTree
" Install fonts for vim-devicons from https://github.com/ryanoasis/nerd-fonts
Plugin 'ryanoasis/vim-devicons'

"tags
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'

"vim sessions
Plugin 'xolox/vim-session'


"vim javascript
Plugin 'pangloss/vim-javascript'

"From http://oli.me.uk/2013/06/29/equipping-vim-for-javascript/
Plugin 'jelera/vim-javascript-syntax'

"provide the keyword highlight of famous js libraries and start to support "native methods.
Plugin 'crusoexia/vim-javascript-lib'

"Indent Guides is a plugin for visually displaying indent levels in Vim.
Plugin 'nathanaelkane/vim-indent-guides'
"to enable type mapleader (in my case space) and ig
"
"colorschemes
Plugin 'crusoexia/vim-monokai'

"Tracks time you spend coding, branch, language, coding editor
"wakatime.com
Plugin 'wakatime/vim-wakatime'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" can now hit space ss to save session for example
let mapleader = " " "this is space

"Encoding must be set to UTF-8 for the glyphs to show
set encoding=utf8
set fileencoding=utf8

" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview


" bind K to grep word under cursor
"nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
" Use Ag instead of grep (more advanced)
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

"Just hit control C and it will move the closing bracket down
imap <C-c> <CR><Esc>O
"<C-g>g mapping. CTRL+g g will put you after the matching bracket


filetype plugin indent on

" Some settings to enable the theme:
" Show line numbers
set number

"let g:solarized_termtrans = 1

" Use syntax highlighting
syntax enable


"let g:solarized_termcolors = 256
"let g:solarized_termcolors = 16

" solarized options
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
"let g:solarized_contrast = "normal"

let g:gruvbox_italic=1

"set term=screen-256color



"Current one
colorscheme zenburn


"MAIN ONES
"colorscheme solarized
"colorscheme monokai
"colorscheme apprentice
"colorscheme gruvbox

"BONUS ONES
"colorscheme railscasts
"colorscheme wombat256
"colorscheme jellybeans
"colorscheme janah
"colorscheme onedark

"set t_Co=256  " vim-monokai now only support 256 colours in terminal."
"let g:monokai_term_italic = 1
"let g:monokai_gui_italic = 1

"let g:onedark_termcolors=16
"colorscheme onedark


"airline Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1
" power fonts
let g:airline_powerline_fonts = 1
"let g:airline_theme='base16'
let g:airline_theme='onedark'

if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

"
let base16colorspace=256  " Access colors present in 256 colorspace



"Auto indent cod
set autoindent

"Switch between different backgrounds
set background=dark
"set background=light

"enable cursor line
set cursorline


"I really get frustrated with tabs that look like white spaces,
"so I ensure they are visible by telling Vim to show all tabs as little arrows ▷.
"This line also ensures that end of lines are shown with a negation sign ¬ :
"highlight tabs and trailing spaces
" turn on with   -> set list
" turn off with  -> set nolist
set listchars=eol:¬,tab:▷\ ,
set list
"set list listchars=tab:→\ ,trail:·,space:␣

"A classic “Python tell” in Vim is the 79th or 80th character highlight:
set colorcolumn=80              " Show the 80th char column.
highlight ColorColumn ctermbg=5

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
set shiftwidth=4
set tabstop=4
set softtabstop=4
"set paste
set relativenumber

"removes newline EOL
"so other non vim/terminal editors don't see extra line
set binary
set noeol
"spaces instead of tab, must be after binary and noel setting
set expandtab

autocmd Filetype html setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab

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
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" NERDTree with Ctrl+n (you can set whatever key you want):
map <C-n> :NERDTreeToggle<CR>

"my own defined shortcut  display all class methods and source code structure
"for tag bar
" C-o used for jumping
"nmap <C-o> :TagbarToggle<CR>
"to open tag bar hit space and o
nnoremap <leader>oo :TagbarToggle<CR>


"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Control + C mapping to run :bp | bd #
" which moves to previous buffer and closes the buffer we just moved from
" this way you can close a buffer and still have a vsplit for example
nnoremap <C-c> :bp\|bd #<CR>

"vim sessions
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"vim sessionc custom mapping
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>


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

"https://github.com/xolox/vim-easytags
" Since version 3.6 the vim-easytags plug-in tries to squeeze as much performance as
" possible out of Vim by using keyword highlighting where this is possible without sacrificing accuracy.
" If your Vim's syntax highlighting is still too slow you can add the following to your [vimrc script] vimrc:
let g:easytags_syntax_keyword = 'always'

"The g:easytags_async option
" By default vim-easytags runs Exuberant Ctags and updates your tags file in the foreground, blocking Vim in the process.
" As your tags files get larger this becomes more annoying. It has been the number one complaint about vim-easytags since
" I published the first release online.  In version 3.5 of the vim-easytags plug-in support for asynchronous tags
" file updates was added. It's not enabled by default yet because I want to make sure I'm not breaking the
" plug-in for the majority of users. However after I've gathered some feedback I definitely want to make this the default mode.
" By setting this option to true (1) you enable asynchronous tags file updates. Good luck! ;-)
let g:easytags_async=1

"By default the plug-in automatically updates and highlights your tags when you stop typing for a moment.
"If you want to disable automatic highlighting while keeping automatic updating enabled you can set this option to false:
let g:easytags_auto_highlight=0



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
au VimEnter * call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
au VimEnter * call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
au VimEnter * call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
au VimEnter * call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
au VimEnter * call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
au VimEnter * call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
au VimEnter * call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

""folding settings
"set foldmethod = indent   "fold based on indent

set foldmethod=syntax
"set foldmethod=manual
set foldlevelstart=1
"set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML


"zm to close fold level by level
"zr open fold level by level
"za to toggle open and close of a fold (don't need to use zc or zo)
"zR open ALL folds

"zc to close a fold
"zo open a fold

"close all folds with zM (not really needed?)
"
" Allow mouse to scroll the vim windows and resize splits
set mouse=a

"Allow mouse to resize splits when vim is inside tmux
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end

" START Speed up Syntax Highlighting
" The defaults for syncing in some syntaxes for vim can be very slow, especially for large files and slow machines.
augroup vimrc
    autocmd!
    autocmd BufWinEnter,Syntax * syn sync minlines=500 maxlines=500
augroup END
" speed up syntax highlighting
set nocursorcolumn
set nocursorline
syntax sync minlines=256
set synmaxcol=300
set re=1
" END speed up syntax highlighting



" Overwrite colorschemes background when trying to enable transparency
" this will allow you to go to transparent mode in in terminal
hi Normal ctermbg=none
highlight NonText ctermbg=none


"Overwrite hightlight color change
"for the GUI
hi Search guifg=grey guibg=blue
" for terminal vim
hi Search cterm=NONE ctermfg=grey ctermbg=blue


" * You can now set a darker background for bright environments. To activate, use:
let g:zenburn_high_Contrast = 1
