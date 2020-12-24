"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" a vimrc experience - by billyxs
"
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" Sections:
"   => Leaders
"   => Plugins
"   => General
"   => Files, backups and undo
"   => Colors and Fonts
"   => Mappings
"   => Abbreviations
"   => Scripts
"   => Buffers
"
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
"   => Leaders
""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations!
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"


"""""""""""""""""""""""""""""""""""""""""""""""
"   => Plugins
"      vim-plug :PlugInstall, :PlugUpdate
"""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Async run
" Plug 'skywind3000/asyncrun.vim'
Plug 'junegunn/goyo.vim'

" Hard mode
Plug 'wikitopian/hardmode'

" Formatting
Plug 'dhruvasagar/vim-table-mode'

" Time tracking
" Plug 'wakatime/vim-wakatime'

" GIT,
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Linting
Plug 'w0rp/ale'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"" Syntax
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'
Plug 'larsbs/vim-xmll'
"Plug 'othree/html5.vim'
Plug 'tpope/vim-markdown'
Plug 'python-mode/python-mode', { 'branch': 'develop' }

Plug 'metakirby5/codi.vim'

"External
Plug 'benmills/vimux'

" Themes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'larsbs/vimterial_dark'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'rakr/vim-one'
Plug 'mhartington/oceanic-next'
Plug 'arcticicestudio/nord-vim'
Plug 'kadekillary/Turtles'
Plug 'embark-theme/vim', { 'as': 'embark' }
Plug 'cormacrelf/vim-colors-github'
call plug#end()

" ALE plugin
let g:ale_completion_enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1

" :ALEFix will try and fix your JS code with ESLint.
" let g:ale_fixers = { 'javascript': [ 'prettier', 'eslint' ] }
" let g:ale_fixers = { 'javascript': [ 'prettier', 'tslint' ] }
" let g:ale_pattern_options = {'\.test.js$': {'ale_enabled': 0}}
"
let g:ale_fixers = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'javascript': [ 'eslint' ],
\  'python': [ 'autopep8' ],
\  'php': ['php', 'psalm'],
\}

" Set this setting in vimrc if you want to fix files automatically on save.
" This is off by default.
let g:ale_fix_on_save = 1

" tpope markdown syntax
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

" vim-jsx - don't require .jsx extension
let g:jsx_ext_required = 0

" javascript-libraries-syntax.vim
let g:used_javascript_libs = 'react'

" python-mode set for python3
let g:pymode_python = 'python3'

" Themes
" neodark
" let g:neodark#background = '#101010'


""""""""""""""""""""""""""""""""""""""""
"   => General
""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=10000

" Persist undo after terminating a session
set undodir=~/.vim/undodir
set undofile
" How many undos
set undolevels=1000
" number of lines to save for undo
set undoreload=10000

" Enable filetype plugins
filetype plugin on
filetype indent on

set nocompatible

" 'matchit.vim' is built-in so let's enable it!
" Hit '%' on 'if' to jump to 'else'.
runtime macros/matchit.vim

" Set to auto read when a file is changed from the outside
set autoread

" Fix ALE autocomplete eagerness
set completeopt+=noinsert

" copy to clipboard
set clipboard=unnamed
map <F10> :set pastetoggle<CR>

" Allow mouse scrolling
set mouse=n

" Search down into folders
set path+=**

" Show line numbers
"set number

" Show line numbers relative to cursor
"set relativenumber

" Minimum number of columns for line numbers
set numberwidth=3

"Always show current position
set ruler

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

" split window handling to always open down or to the right
set splitbelow
set splitright

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Ignore files
set wildignore+=*/lib,*/.git,*/coverage,*/node_modules,*/tmp/*,*.so,*.swp,*.zip

" Don't auto indent
set noai

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
autocmd FileType javascript autocmd BufWritePre <buffer> %s/\s\+$//e

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
"   => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in git et.c anyway...
set nobackup
set nowb
set noswapfile " No swap file

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""
"   => Colors and Fonts
""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting / better than syntax on
if !exists(g:syntax_on)|syntax enable|endif

if (has("termguicolors"))
    set termguicolors
endif

" Set extra options when running in GUI mode
if has("gui_running")
    set guioptions-=T
    set guioptions+=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

set background=dark

" Colorscheme - Now playing
colorscheme palenight

" Approved Themes
let themes = [
      \"ayu",
      \"dracula",
      \"embark",
      \"github",
      \"nord",
      \"OceanicNext",
      \"one",
      \"palenight",
      \"spacegray",
      \"turtles",
      \"twilight",
      \"vimterial_dark",
      \"znake"]

function! ChangeTheme()
  echom index(g:themes, g:colors_name).g:colors_name
  let new_theme = ""
  if g:colors_name || g:colors_name ==# g:themes[-1]
    let new_theme = g:themes[0]
  else
    let s:n = index(g:themes, g:colors_name) + 1
    let new_theme = g:themes[s:n]
  endif

  execute 'colorscheme '.new_theme
  echo new_theme
endfunction
nnoremap <leader>cn :call ChangeTheme()<cr>


" Colorscheme extras
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:nord_italic = 1
let g:nord_uniform_status_lines = 1


""""""""""""""""""""""""""""""""""""""""
"   => Mappings
""""""""""""""""""""""""""""""""""""""""

"" Vim file manager
" Open vimrc in split
noremap <leader><leader>ev :vsplit $MYVIMRC<cr>
" Source vimrc
noremap <leader><leader>sv :source $MYVIMRC<cr>

" SEARCH!
nnoremap <leader>/ :%s/\V/gc<Left><Left><Left>

" FZF/Rg search
nnoremap <leader>a :Rg<space><CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>bu :Buffers<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --smart-case --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Disable use of arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" ESC from insert mode with jk
" inoremap jk <esc>
" Don't allow <esc> in insert mode
" inoremap <esc> <nop>

" delete line
inoremap <c-d> <esc>ddi

" copy paste
nnoremap <space>c viw"gy
nnoremap <space>v "gp
vnoremap <space>c "gy
vnoremap <space>v "gp

" change colorscheme
nnoremap <leader>cc :Colors<cr>

" Surrounds
nnoremap <leader>" viw<esc>`<i"<esc>`>la"<esc>
nnoremap <leader>' viw<esc>`<i'<esc>`>la'<esc>
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>( <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>) <esc>`<i(<esc>`>la)<esc>
vnoremap <leader>[ <esc>`<i[<esc>`>la]<esc>
vnoremap <leader>] <esc>`<i[<esc>`>la]<esc>

" Motions
nnoremap H 0
onoremap H 0
vnoremap H 0

nnoremap L $
onoremap L $
vnoremap L $

" save file
nnoremap <leader>s :update!<cr>
inoremap <leader>s <esc>:update!<cr>

" execute macro
nnoremap Q @q<cr>

" Save and quit with zz
nnoremap zz ZZ
nnoremap <leader>q :q<cr>

" Go to last buffer
nnoremap <leader>bb :b#<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
" nnoremap gb :ls<cr>:buffer<space>
nnoremap gb :Buffers<cr>

" Go to windows with hjkl
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k

" Full screen window 
nnoremap <c-m> <c-w>\|
" Equal width windows
nnoremap <c-n> <c-w>=

" Terminal window
nnoremap <leader>t :terminal<cr>
nnoremap <leader>vt :vert terminal<cr>


" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" Create a newline from where the cursor is
nnoremap <leader>j i<CR><ESC>

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" open current director of current file in vertical split
nnoremap <leader>vs :vs %:h<cr>
nnoremap <leader>fs <C-w>f

" Copy paragraph
noremap cp yap<S-}>p


"""""""""""""""""""""""""""""""""""""
" Coding snippets
"""""""""""""""""""""""""""""""""""""
" Snippet like mappings
" Describe block
nnoremap <leader>des odescribe(''<ESC>mma, () => {<CR><CR>})<ESC>`mi

" Log selection or what is under the cursor
nnoremap <leader>log :call LogIt(0)<CR>
vnoremap <leader>log "zy:call LogIt(1)<CR>

" Create a for in loop for list/iterator of selection or word under cursor
nnoremap <leader>for :call ForInList(0)<CR>
vnoremap <leader>for "zy:call ForInList(1)<CR>
nnoremap <leader>fil :call ForInList(0)<CR>
vnoremap <leader>fil "zy:call ForInList(1)<CR>

" Create a for in loop for dictionary of selection or word under cursor
nnoremap <leader>fork :call ForInKeyValue(0)<CR>
vnoremap <leader>fork "zy:call ForInKeyValue(1)<CR>
nnoremap <leader>fik :call ForInKeyValue(0)<CR>
vnoremap <leader>fik "zy:call ForInKeyValue(1)<CR>
nnoremap <leader>fid :call ForInKeyValue(0)<CR>
vnoremap <leader>fid "zy:call ForInKeyValue(1)<CR>

" Import module
nnoremap <leader>imp :call Import()<CR>


" It block
nnoremap <leader>it oit(''<ESC>mma, () => {<CR><CR>})<ESC>`mi

" Spell check with fzf
nnoremap z= :call FzfSpell()<cr>

" Format JSON
nnoremap <leader>js :%!python -m json.tool

" vimux commands - https://raw.githubusercontent.com/benmills/vimux/master/doc/vimux.txt
nnoremap <leader>vp :VimuxPromptCommand<CR>
nnoremap <leader>vl :call VimuxSendKeys("C-c")<CR>:VimuxRunLastCommand<CR>
nnoremap <leader>vi :VimuxInspectRunner<CR>
nnoremap <leader>vc :VimuxCloseRunner<CR>
nnoremap <leader>vx :VimuxInterruptRunner<CR>
nnoremap <leader>vz :VimuxZoomRunner<CR>
nnoremap <leader>vd :call VimuxRunCommand("clear;ssh -A dev124-uswest1adevc;")<CR>:call VimuxRunCommand("pos")<CR>
nnoremap <leader>vm :VimuxInterruptRunner<CR>:call VimuxRunCommand("clear;tox -e mypy;")<CR>
nnoremap <leader>vt :VimuxInterruptRunner<CR>:call VimuxRunCommand("clear;make test;")<CR>

" Work time tracking
nnoremap <leader>dh :call DayHeader()<cr>
nnoremap <leader>st istart:<space><space><esc>:call Time()<cr>
nnoremap <leader>et iend:<space><space><esc>:call Time()<cr>
vnoremap <leader>ct "gy:call CalculateWorkTime()<cr>

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


""""""""""""""""""""""""""""""""""""""""
"   => Abbreviations
""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""
"   => Ex shortcuts / Scripts
""""""""""""""""""""""""""""""""""""""""

command! RFile call RemoveFile()
command! Delete call RemoveFile()

command! E Explore

command! Date call Date()

command! Time call Time()

command! Import call Import()

command! Dict call Dict()

""""""""""""""""""""""""""""""""""""""""
"   => Buffers
""""""""""""""""""""""""""""""""""""""""

" autocmd BufEnter *.md colorscheme sonofobsidian

autocmd BufNewFile,BufRead *.py set ft=python
autocmd BufNewFile,BufRead *.js set ft=javascript
autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Javascript
augroup filetype_javascript
  autocmd!

  command! Lintjs call Lintjs()
  command! Lintjsp call Lintjsp()
  command! Lintts call Lintts()

  " autocmd FileType javascript set formatprg=prettier\ --stdin
  " autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

  " Import modules for javascript
  autocmd Filetype javascript :iabbrev im import<space><space>from<space><left><left><left><left><left><left><left>

  " Export modules and functions for javascript
  autocmd Filetype javascript :iabbrev exc export const =
  autocmd Filetype javascript :iabbrev exf export function() {}
  autocmd Filetype javascript :iabbrev exd export default
  autocmd Filetype javascript nnoremap <leader>c I//<esc>
augroup END


augroup filetype_markdown
  autocmd!
  nnoremap <leader>li :call MarkDownLink()<CR>

  autocmd Filetype *.md :inoremap link -<space>[]()<esc><left>p<left>
augroup END

augroup filetype_python
  autocmd!
  " Abbreviations for python
  ab def def() -> None:<esc>F(i
  ab fix @fixture<esc>odef myfixture() -> Iterator:<esc>owith mock.patch("") as mock_object:<esc>oyield mock_object
  ab import from import
  ab typing from typing import<space>
  ab typeddict class Item(TypedDict):
  ab class class Name():<esc>F<space>
augroup END

source ~/.vim/functions.vim

"""""""""""""""""""""""""""""""""""""""""
:finish

Vim built the hard way

