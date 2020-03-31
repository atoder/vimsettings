" For Mac OS X, use Karabiner app to remap ESC to Caps Lock
" It's easier to use than hitting ESC key
"
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

"I really get frustrated with tabs that look like white spaces,
"so I ensure they are visible by telling Vim to show all tabs
"as little arrows ▷.
"This line also ensures that end of lines are shown with a negation sign ¬ :
"highlight tabs and trailing spaces
" turn on with   -> set list
" turn off with  -> set nolist
"set nolist
"set listchars=eol:¬,tab:▷\ ,
set listchars=tab:▷\ ,
set list

"show status at the bottom of vim file
set laststatus=2

"tail of the filename
set statusline=%f

"Auto indent
set autoindent

" does the right thing (mostly) in programs
set smartindent

" stricter rules for C programs
set cindent

" Buffer screen updates instead of updating all the time
"set lazyredraw

"showcmd show input of incomplete command.
set sc

" show will breifly jump to the matching brace when you insert one
set showmatch

"enable cursor line
"set cursorline

"Switch between different backgrounds
set background=dark
"set background=light

"Sometimes it is helpful if your working directory
"is always the same as the file you are editing.
"To achieve this, put the following in your vimrc:
set autochdir

" Control + C mapping to run :bp | bd #
" which moves to previous buffer and closes the buffer we just moved from
" this way you can close a buffer and still have a vsplit for example
nnoremap <C-c> :bp\|bd #<CR>

" yy will not just use internal vim buffer but will also copy
" into OS's clipboard
set clipboard=unnamed


let python_highlight_all=1

autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype php setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2 expandtab

au BufNewFile,BufRead *.ejs set filetype=javascript
au BufNewFile,BufRead *.handlebars set filetype=html
au BufNewFile,BufRead *.eco set filetype=html


"mapping buffer switching and closing to shortcuts
map bn :bn<cr>
map bp :bp<cr>
map bd :bd<cr>

" map leader is a space in this case
" can now hit space ss to save session for example
let mapleader = " "

"Encoding must be set to UTF-8 for the glyphs to show
set encoding=utf8
set fileencoding=utf8


"---------- CUSTOM MAPPING -----
"
" Switch to last active buffer
noremap <leader>b :buffer #<CR>

"space space y will copy all the text
map <Leader><Leader>y :%y+<CR>

map <Leader>hi :hi Comment guifg=#7ea869 ctermfg=green<CR>

"pick random color scheme
map <Leader>rc :RandomColorScheme<CR>
"run it on vim start
autocmd VimEnter * RandomColorScheme

"---------- CUSTOM MAPPING END -----

" Allow mouse to scroll the vim windows and resize splits
set mouse=a

"Allow mouse to resize splits when vim is inside tmux
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end


"This results in the character being highlighted in magenta (the screenshot is
"in DarkCyan) when the line goes over the 80-character maximum.
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


" Overwrite hightlight color change for SEARCH
" for the GUI
"hi Search guifg=black guibg=red
" for terminal vim
"hi Search cterm=NONE ctermfg=black ctermbg=red

"Highlight all search pattern matches
set hlsearch

" While typing a search command, show where the pattern,
" as it was typed so far, matches.
set incsearch

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

"DISABLE netrw
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
" Tweaks for browsing
"
"let g:netrw_banner = 0        " disable annoying banner
"let g:netrw_browse_split = 4  " open in prior window
"let g:netrw_altv = 1          " open splits to the right
"let g:netrw_liststyle = 3     " tree view
"let g:netrw_winsize = 25    " width in percent

"let g:netrw_browse_split = 0  " reuse the same window
"let g:netrw_list_hide=netrw_gitignore#Hide()
"let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" To create a file use %
" To create a folder use d

" for toggling netrw like nerdtree
"let g:NetrwIsOpen=0
"function! ToggleNetrw()
"    if g:NetrwIsOpen
"        let i = bufnr("$")
"        while (i >= 1)
"            if (getbufvar(i, "&filetype") == "netrw")
"                silent exe "bwipeout " . i
"            endif
"            let i-=1
"        endwhile
"        let g:NetrwIsOpen=0
"    else
"        let g:NetrwIsOpen=1
"        silent Vexplore
"    endif
"endfunction

" Add your own mapping. For example:
"noremap <silent> <C-n> :call ToggleNetrw()<CR>
" OLD netrw with Ctrl+n (you can set whatever key you want):



" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" FOLDING:
"set foldmethod=indent   "fold based on indent
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


" FOLDING
" zf to create a fold
" zm to close fold level by level
" zr open fold level by level
" za to toggle open and close of a fold (don't need to use zc or zo)
" zR open ALL folds

" zc to close a fold
" zo open a fold

"close all folds with zM (not really needed?)
"
" The easiest way to disable (and enable) folding on the fly is zi.
" zi is the normal mode command that toggles 'foldenable',
" just like :set foldenable!.
" Mnemonic: "fold invert". See :h zi.



" START PLUGINS:
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Initialize plugin system
" Install code completion using Vim plug (doesn't have vundle version)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}


"Tagbar replacement
Plug 'liuchengxu/vista.vim'

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

 " coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ 'coc-json',
  \ 'coc-java',
  \ 'coc-python',
  \ 'coc-phpls',
  \ 'coc-highlight',
  \ ]
"make sure to have eslint set up in local directory
"eslint --init

"neoclide settings
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
"For commenting and uncommenting blocks of line
Plug 'scrooloose/nerdcommenter'
"Comment out the current line or text selected in visual mode.
"[count]<leader>cc |NERDComComment|
"Uncomments the selected line(s).
"[count]<leader>cu |NERDComUncommentLine|
"Comments out the selected lines with a pretty block formatted layout.
"[count]<leader>cs |NERDComSexyComment|

Plug 'christoomey/vim-tmux-navigator'

"Easy switching between buffers - vim-airline will show buffer at the top
"unless multiple tabs are open
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" airline Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#tabline#enabled                      = 1
let g:airline#extensions#tabline#buffer_idx_mode              = 1
"let g:airline#extensions#tabline#show_buffers                 = 1
"let g:airline#extensions#tabline#buffer_min_count             = 1
"let g:airline#extensions#tabline#tab_min_count                = 1
"let g:airline#extensions#branch#enabled                       = 1
"let g:airline#extensions#tagbar#enabled                       = 0

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

" power fonts
let g:airline_powerline_fonts = 1
"let g:airline_theme='base16'

"Main
let g:airline_theme='onedark'
"let g:airline_theme='gotham256'
"let g:airline_theme='purify'

" Gruvbox colorscheme
Plug 'morhetz/gruvbox'

"Monokai
Plug 'sickill/vim-monokai'

""jellybeans colorscheme
Plug 'nanotech/jellybeans.vim'

""vim-synthwave84 colorscheme
Plug 'artanikin/vim-synthwave84'

""vim horizon synthwave colorscheme
Plug 'ntk148v/vim-horizon'

""vim snazzy bright colors colorscheme
Plug 'connorholyday/vim-snazzy'

""src Dark colorscheme
Plug 'srcery-colors/srcery-vim'

""cobatl2 colorscheme
Plug 'herrbischoff/cobalt2.vim'

Plug 'aonemd/kuroi.vim'

"random colorscheme picker - picks automatically
Plug 'xolox/vim-colorscheme-switcher'
Plug 'xolox/vim-misc'

"" candycode
Plug 'vim-scripts/candycode.vim'

"" colorscheme meta5
Plug 'christophermca/meta5'

"colorscheme lucius2
Plug 'maksimr/Lucius2'

"busybee colorscheme
Plug 'vim-scripts/BusyBee'


""nightowl theme
Plug 'haishanh/night-owl.vim'

"wimstefan/vim-artesanal colorscheme
Plug 'wimstefan/vim-artesanal'

"gruvbox material
Plug 'gruvbox-material/vim', {'as': 'gruvbox-material'}


"Purify colorscheme
Plug 'kyoz/purify', { 'rtp': 'vim' }

"moonfly
Plug 'bluz71/vim-moonfly-colors'

"badwolf
Plug 'leafgarland/badwolf'

"This plugin is used for displaying thin vertical lines at each indentation
"level for code indented with spaces
Plug 'Yggdroot/indentLine'

" IndentLine {{
"
"each indent level has a distinct character.
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indentLine_char = '┊'
":IndentLinesToggle toggles lines on and off.
" }}


" React Syntax Highlighting
Plug 'othree/yajs.vim'

"For es next
Plug 'othree/es.next.syntax.vim'

"Nerd Tree
Plug 'scrooloose/nerdtree'
"shows git marks in nerd tree
Plug 'Xuyuanp/nerdtree-git-plugin'
nnoremap <C-n> :NERDTreeToggle<CR>

""https://github.com/jaxbot/semantic-highlight.vim"
"Where every variable is a different color, an idea popularized by Evan Brooks
"blog post.
"https://medium.com/@evnbr/coding-in-color-3a6db2743a1e
Plug 'jaxbot/semantic-highlight.vim'
nnoremap <Leader>s :SemanticHighlightToggle<cr>

"Plug 'leafgarland/typescript-vim' "Typescripts Syntax
"Plug 'plasticboy/vim-markdown' "Markdown's Syntax ]'
"Plug 'ap/vim-css-color' "Help colorize text color
"Plug 'Valloric/MatchTagAlways' "Always highlights the XML/HTML tags that enclose your cursor location''


"vim javascript
let g:javascript_plugin_jsdoc = 1


" https://andrewsinclair.github.io/vim/react/javascript/syntastic/eslint/2017/02/28/vim-setup-for-developing-react-js.html
" javascript and jsx
let g:syntastic_javascript_checkers = ['eslint']
"This syntax file is for ECMAScript future syntax. Need to work with yajs.vim.
"Plug 'othree/es.next.syntax.vim'

let g:jsx_ext_required = 1 " Allow JSX in normal JS files



"tags
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-easytags'

" ----- xolox/vim-easytags settings -----
"set tags=~/Sites/tags
"let g:easytags_events = ['BufReadPost', 'BufWritePost']
"let g:easytags_async = 1
"let g:easytags_dynamic_files = 2
"let g:easytags_resolve_links = 1
"let g:easytags_suppress_ctags_warning = 1

"Provides an overview of the structure of source code files
"Lean & mean status/tabline for vim that's light as air.
"Plug 'majutsushi/tagbar'
"Plug 'hushicai/tagbar-javascript.vim'

"nmap <C-o> :TagbarToggle<CR>
"to open tag bar hit space and o
"nnoremap <leader>oo :TagbarToggle<CR>
"Updated to use Vista coc
nnoremap <leader>oo :Vista coc<CR>


""A fancy start screen for Vim.
Plug 'mhinz/vim-startify'

"" git in vim
"" :GStatus
"" :Gwrite
"" :Gcommit
Plug 'tpope/vim-fugitive'

""Vim Better Whitespace Plug
"":ToggleWhitespace
"": StripWhitespace
Plug 'ntpeters/vim-better-whitespace'

"Automatic folds (that is, folds generated by a fold method different
"from manual), bog down VIM noticeably in insert mode.
"They are also often recomputed too early (for example, when inserting an
"opening fold marker whose closing counterpart is yet missing to complete
"the fold.)
Plug 'Konfekt/FastFold'

"FastFold integrates with the plug-in vim-stay that restores the folds of
"a file buffer by :mkview and :loadview.
Plug 'kopischke/vim-stay'

"syntax cheker
Plug 'scrooloose/syntastic'

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" custom syntastic handling
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol='✗'
let g:syntastic_style_warning_symbol='⚠'

"space st will enable and disable syntastic
nmap <leader>st :SyntasticToggleMode<CR>




"Automatic close for common block and scope identifiers such as brackets
" parentheses, brace, squares
"https://github.com/jiangmiao/auto-pairs
"Something I’ve found to be very useful,
"which doesn’t require any bundles other than delimitMate really,
"is to add a key binding that will split my current line.
" So if I type {, delimitMate will insert } after my cursor,
" then I can execute my binding that will insert a new line in
" the middle of the two ready to receive some code.
Plug 'Raimondi/delimitMate'
"Just hit control C and it will move the closing bracket down
imap <C-c> <CR><Esc>O
"<C-g>g mapping. CTRL+g g will put you after the matching bracket


" silver surfer search text ack bundle
Plug 'ggreer/the_silver_searcher'
Plug 'rking/ag.vim'

" bind shift KK to grep word under cursor
" Use Ag instead of grep (more advanced)
nnoremap KK :Ag! "\b<C-R><C-W>\b"<CR>:cw<CR>

" :GitLog
Plug 'kablamo/vim-git-log'

" Install fonts for vim-devicons from https://github.com/ryanoasis/nerd-fonts
Plug 'ryanoasis/vim-devicons'

" Easily interact with tmux from vim
Plug 'benmills/vimux'
" Prompt for a command to run in another pane
map <Leader><Leader>p  :VimuxPromptCommand<CR>
" rerun previous command
map <Leader><Leader>r :VimuxRunLastCommand<CR>

"Supertab is a vim plugin which allows you to use <Tab> for all your
"insert completion needs
"Plug 'ervandew/supertab'

"Show which line changed since your last commit.
"GitGutterToggle
Plug 'airblade/vim-gitgutter'

"Indent Guides is a plugin for visually displaying indent levels in Vim.
Plug 'nathanaelkane/vim-indent-guides'
"to enable type mapleader (in my case space) and ig

"New ctrlp
Plug 'ctrlpvim/ctrlp.vim'

"Amazing code completion
"Plug 'Valloric/YouCompleteMe'
" These are the tweaks I apply to YCM's config, you don't need them but they
" might help.
" YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
"let g:ycm_add_preview_to_completeopt=0
"let g:ycm_confirm_extra_conf=0
"set completeopt-=preview

"New code completion
" Use release branch (Recommend)
" Cant install it with Vundle so use
" https://github.com/neoclide/coc.nvim/wiki/Install-coc.nvim
" git clone https://github.com/neoclide/coc.nvim.git --depth=1
" https://medium.com/@rohmanhakim/how-to-set-up-code-completion-for-vim-in-macos-9766dd459385
"Plug 'neoclide/coc.nvim'

" default c config
" To auto-complete source code for C family,
" you should provide custom .ycm_extra_conf.py file for your project.
" If you don’t do this, YCM will be unable to use semantic completion.
"let g:ycm_global_ycm_extra_conf = "$HOME/.ycm_extra_conf.py"

" All of your Plugins must be added before the following line
call plug#end()
"END PLUGINS:


"ENABLE italic fonts
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic

"Enable HTML attributes to be italic
highlight htmlArg cterm=italic gui=italic

"Enable HTML italic highlight
highlight htmlItalic cterm=italic gui=italic

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif


"put away .swp files into home dir instead of cluttering up in your projects
" Don't forget to create this directory
set swapfile
set dir=~/tmp/

" MAIN FAVORITE ONES COLORSCHEMES AND FONTS:
" * Hermit/Hurmit NerdFontCompletemono
" * Fantasque
" * Operator-Mono - book
" * ProFont for powerline
" * cascadia code
" * Lekton nfplus
" * Fura Mono Regular for Powerline Nerd Font Complete Mono
" * ShureTechnoMono Nerd Font
" * Space Mono For Powerline
" * NovaMoto
" * font Gohu
" * Programma
" * Anonymous pro
" * Iosevkak
" * Input Mono
" * Dank Mono
" * Fira Mono Powerline
" * Overpass mono
" * ProggyVector
" * Proggy
" * SF Mono
" * PT Mono
" * IBM Plex Mono
" * Inconsolata-g
" * Office-Code-Pro - medium
" * Andale mono
" * Robot Mono Version
" * Terminus font and Darkside iTerm2 color preset
" * Hack Font
" * Consolas
" * M+ 1M font
" * Monaco 14pt

" MAIN FAVORITE iterm2 colorschemes
" 0) Snazzy modified (by me)
" 1) Darkside
" 2) - favorite one is Molokai
" 3) One Dark
" 4) space-vim-dark
" 5) gruvbox-dark



"by default it will be default
"colorscheme default

" artesanal colorscheme works well with dank mono font
"- all hovered keywords will turn italic
"colorscheme artesanal
"colorscheme srcery
"colorscheme kuroi
"colorscheme cobalt2
"colorscheme meta5
"colorscheme night-owl
"colorscheme candycode
"colorscheme busybee
"colorscheme jellybeans
"colorscheme snazzy
"colorscheme purify
"colorscheme synthwave84
"colorscheme gruvbox
"colorscheme gruvbox-material
colorscheme slate
"colorscheme base16-default-dark
"colorscheme monokai
"colorscheme horizon
"colorscheme gotham256
"colorscheme badwolf
"colorscheme moonfly


"light themes - don't forget to set to light background
" and might have to move to the bottom of the file
" colorscheme peachpuff
"colorscheme zellner

" need to install
" colorscheme evening
" colorscheme janah
" colorscheme space-vim-dark

"++++++++++++++++++++++++++++
"  custom highlights below
"++++++++++++++++++++++++++++

" Overwrite colors and font style
highlight Comment cterm=italic gui=italic

"Enable HTML attributes to be italic
highlight htmlArg cterm=italic gui=italic

"Enable HTML italic highlight
highlight htmlItalic cterm=italic gui=italic

"grey comments
"hi Comment guifg=#5C6370 ctermfg=59

"make background of any theme black
"highlight Normal guibg=black guifg=white

" Overwrite colorschemes background when trying to enable transparency
" this will allow you to go to transparent mode in in terminal
" Set background color with iterm2 or whatever terminal you are using
"hi Normal guibg=NONE ctermbg=NONE
"overwites the non text background
hi NonText guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE


"green comments
hi Comment guifg=#7ea869 ctermfg=green
"hi Comment guifg=#a9f2a8 ctermfg=lightgreen
"hi Comment guifg=#a9f2a ctermfg=DarkGreen
"hi Comment guifg=#a9f2a8 ctermfg=lightgreen

" clears Special keyword highlight
" and sets it to custom light blue color
"hi clear Special
"hi Special term=bold ctermfg=81 guifg=#66D9EF

" gutter aka sign column
"highlight SignColumn guibg=black ctermbg=black

" Make gutter same color as where your line numbers show up
"highlight clear SignColumn


"make javascript
"au Colorscheme * :hi javascriptNodeGlobal gui=italic cterm=italic
"highlight default javascriptNodeGlobal cterm=italic
"highlight default javascriptMethodName cterm=italic ctermfg=grey ctermbg=white