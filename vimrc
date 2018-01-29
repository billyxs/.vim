"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Sections:
"    -> Plugins - vim-plug :PlugInstall, :PlugUpdate
"    -> General
"    -> Files and backups
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Text, tab and indent related
"    -> Text, Writing and formatting
"    -> Editing mappings
"    -> Moving around, tabs and buffers
"    -> Macros and Templates
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""
" Plugins - vim-plug :PlugInstall, :PlugUpdate
"""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Time tracking
Plug 'wakatime/vim-wakatime'

" File system
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Text, Editing
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'lervag/vimtex'

" GIT,
"Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Linting
Plug 'w0rp/ale'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"" Syntax
" Plug 'slim-template/vim-slim'
" Plug 'pangloss/vim-javascript'
" Plug 'jelera/vim-javascript-syntax'
Plug 'mxw/vim-jsx'
" Plug 'jaxbot/semantic-highlight.vim'
"Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/yajs.vim'
" Plug 'othree/html5.vim'
Plug 'othree/es.next.syntax.vim'

" Navigation
" Plug 'easymotion/vim-easymotion'

" Status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'rainglow/vim'
"Plug 'flazz/vim-colorschemes'
Plug 'seesleestak/oceanic-next'
Plug 'rakr/vim-one' " colorscheme one
Plug 'beigebrucewayne/Turtles'
Plug 'ayu-theme/ayu-vim'
Plug 'KeitaNakamura/neodark.vim'
"Plug 'mhartington/oceanic-next'
Plug 'ajh17/Spacegray.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'nightsense/seabird'
Plug 'dunckr/vim-monokai-soda'
"Plug 'encody/nvim'
"Plug 'hzchirs/vim-material'
"Plug 'baines/vim-colorscheme-thaumaturge'
"Plug 'nightsense/carbonized'
"Plug 'tpope/vim-vividchalk'
Plug 'morhetz/gruvbox'
" Plug 'nanotech/jellybeans.vim'
" Plug 'sjl/badwolf'
" Plug 'dracula/vim' " rainglow/vim uses the same folder name
" Plug 'shawncplus/skittles_berry'
call plug#end()

" NERDTree
map <F2> ;NERDTreeToggle<CR>
nmap <leader>n ;NERDTreeToggle<CR>

" ALE plugin
let g:ale_completion_enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_pattern_options = {'\.spec.js$': {'ale_enabled': 0}}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" Airline
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" vim-jsx - don't require .jsx extension
let g:jsx_ext_required = 0

" javascript-libraries-syntax.vim
let g:used_javascript_libs = 'react'

" Themes
" neodark
let g:neodark#background = '#101010'

" Markdown
let vim_markdown_preview_github=1
let vim_markdown_preview_browser='Google Chrome'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=10000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" copy to clipboard
set clipboard=unnamed
map <F10> :set pastetoggle<CR>

" Allow mouse scrolling
set mouse=n

" Search down into folders
set path+=**

" Set keystroke timeout
set timeoutlen=20

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in git et.c anyway...
set nobackup
set nowb
set noswapfile " No swap file


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 5 lines to the cursor - when moving vertically using j/k
set so=5

" Turn on the WiLd menu
set wildmenu

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" MINE
" Ignore files
set wildignore+=*/lib,*/.git,*/coverage,*/node_modules,*/tmp/*,*.so,*.swp,*.zip

" Show relative line numbers
set rnu

" Show line numbers
set number

" Don't auto indent
set noai

"Always show current position
set ruler

" highlight lines that cross 80 characters
highlight ColorColumn ctermbg=cyan guibg=cyan guifg=black
call matchadd('ColorColumn', '\%81v', 100)

" Underline cursor line
hi CursorLine gui=underline cterm=underline guibg=NONE guifg=NONE

" netrw
" SEEMORE - https://shapeshed.com/vim-netrw/#netrw-the-unloved-directory-browser
" tree view
let g:netrw_liststyle=3
" remove banner
let g:netrw_banner=0
" directory width
let g:netrw_winsize = 20

"let g:netrw_browse_split = 4
"let g:netrw_altv = 1
"augroup ProjectDrawer
"  autocmd!
"  autocmd VimEnter * :Vexplore
"augroup END

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting / better than syntax on
if !exists(g:syntax_on)|syntax enable|endif

if (has("termguicolors"))
  set termguicolors
endif

" Approved Themes
"colorscheme one " one-dark
"colorscheme spacegray
"colorscheme juicy
"colorscheme bold
"colorscheme turtles
"colorscheme vividchalk
"colorscheme neodark
colorscheme hydrangea
"colorscheme petrel
"colorscheme ayu
"colorscheme solarized8_dark_flat
"colorscheme gruvbox
"colorscheme carbonized-dark
"let g:oceanic_next_terminal_bold = 1
"let g:oceanic_next_terminal_italic = 1
"colorscheme OceanicNext


set background=dark

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" autocmd BufNewFile,BufRead *.json set ft=javascript
" autocmd BufNewFile,BufRead *.js set ft=javascript
autocmd BufNewFile,BufReadPost *.md set filetype=mkd


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tabs
set smarttab
" Use tabs instead of spaces
set expandtab
" 1 tab == 2 spaces
set tabstop=2
set shiftwidth=2

" tabs to spaces
retab

" remove trailing spaces on :w
autocmd BufWritePre * %s/\s\+$//e


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text, Writing and formatting
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Autocomplete
autocmd Filetype markdown setlocal textwidth=78
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" With a map leader it's possible to do extra key combinations
let mapleader = ","
let g:mapleader = ","

" FZF/Ag search
nmap <leader>t ;Files<CR>
nmap <leader>a ;Ag<space><CR>
nmap <leader>f ;Ag <C-r><C-w><CR>
nmap <leader>bu ;Buffers<CR>

" Don't use arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" colon without shift
noremap : ;
noremap ; :

" Quick save
nnoremap <leader><leader>s :update!<CR>
inoremap <leader><leader>s <ESC><leader>s

" Esc with jk
inoremap jk <ESC>
nnoremap zz ZZ

" Remap VIM 0 to first non-blank character
" map 0 ^

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()

" Home Num Keys
nnoremap <C-I> :call VimLock(1)<CR>i
function! VimLock(enable)
  if a:enable
    inoremap m 1
    inoremap , 2
    inoremap . 3
    inoremap j 4
    inoremap k 5
    inoremap l 6
    inoremap u 7
    inoremap i 8
    inoremap o 9
    inoremap @ 0
    inoremap <Esc> <Esc>:call VimLock(0)<CR>
  else
    iunmap m
    iunmap ,
    iunmap .
    iunmap j
    iunmap k
    iunmap l
    iunmap u
    iunmap i
    iunmap o
    iunmap @
    iunmap <Esc>
  endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" map <space> /
" map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Create a newline from where the cursor is
nmap <leader>j i<CR><ESC>

" Newline with no insert
nmap oo o<ESC>
nmap OO O<ESC>

" Smart way to move between windows
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Buffers
" Go to previous buffer
map <leader>b ;b#<CR>
" Go to next buffer
map <leader>bn ;bn<CR>
" Go to previous buffer
map <leader>bp ;bp<CR>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
" map <leader>tn :tabnew<cr>
" map <leader>to :tabonly<cr>
" map <leader>tc :tabclose<cr>
" map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Macros and Templates
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Javascript
" Easy console log
function! EasyConsoleLog()
  let word = expand("<cword>")
  execute "normal! oconsole.log('".word." = ', ".word.")"
endfunction

nnoremap <leader>log :call EasyConsoleLog()<CR>


" Describe block
map <leader>des odescribe(''<ESC>mma, function() {<CR><CR>})<ESC>`mi

" It block
map <leader>it oit(''<ESC>mma, function() {<CR><CR>})<ESC>`mi

" Expect equal test
map <leader>ee oexpect().to.equal()<ESC>^f)i

" Expect statement - jump to set test value
map <leader>eev ^2f)i''<C-o>h
map <leader>een ^2f)i
map <leader>eeu ^2f)iundefined<ESC>
map <leader>eet ^2f)itrue<ESC>
map <leader>eef ^2f)ifalse<ESC>

" Import statements
nnoremap <leader>imp iimport  from ''<ESC>2Bhi
nnoremap <leader>imr iimport React from 'react'<CR>
nnoremap <leader>imc iimport { connect } from 'react-redux'<CR>

map <leader>thunk i(dispatch, getState) => { }<ESC>hi<CR><ESC>O
map <leader>red a.reduce((memo, item) => { }, [])<ESC>F}h
map <leader>map a.map(item => { })<ESC>F}h
map <leader>fil a.filter(item => { })<ESC>F}h
map <leader>ato m`f[r{f]r}``
map <leader>ota m`f{r[f}r]``

nnoremap <leader>comp :read ~/.vim/templates/react-component.js<CR>

" GIT commands
map <leader>ga ;!git add --all -p<CR>
map <leader>gp :!git pull --rebase<CR>

" Autocomplete
set completeopt=longest,menuone
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Jumps
function! GotoJump()
  jumps
  let j = input("Please select your jump: ")
  if j != ''
    let pattern = '\v\c^\+'
    if j =~ pattern
      let j = substitute(j, pattern, '', 'g')
      execute "normal " . j . "\<c-i>"
    else
      execute "normal " . j . "\<c-o>"

    endif
  endif
endfunction

nmap <leader>u :call GotoJump()<CR>

:finish

Vim is fun
