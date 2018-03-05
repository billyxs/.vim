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
"   => Status Line
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

" Time tracking
Plug 'wakatime/vim-wakatime'

" GIT,
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Linting
Plug 'w0rp/ale'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"" Syntax
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-markdown'
Plug 'othree/yajs.vim'
Plug 'jason0x43/vim-js-syntax'

" Themes
Plug 'arcticicestudio/nord-vim'
Plug 'beigebrucewayne/Turtles'
Plug 'KeitaNakamura/neodark.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'rainglow/vim'
Plug 'seesleestak/oceanic-next'
Plug 'rakr/vim-one' " colorscheme one
Plug 'ayu-theme/ayu-vim'
Plug 'lifepillar/vim-solarized8'
Plug 'dunckr/vim-monokai-soda'
call plug#end()

" ALE plugin
let g:ale_completion_enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'
let g:ale_sign_column_always = 1

" :ALEFix will try and fix your JS code with ESLint.
let g:ale_fixers = {
\   'javascript': ['eslint'],
\}
let g:ale_pattern_options = {'\.test.js$': {'ale_enabled': 0}}

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

" tpope markdown syntax
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" pangloss/vim-javascript
let g:javascript_plugin_jsdoc = 1

" vim-jsx - don't require .jsx extension
let g:jsx_ext_required = 0

" javascript-libraries-syntax.vim
let g:used_javascript_libs = 'react'

" Themes
" neodark
let g:neodark#background = '#101010'


""""""""""""""""""""""""""""""""""""""""
"   => General
""""""""""""""""""""""""""""""""""""""""

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

" Show line numbers
set number

" Show line numbers relative to cursor
set relativenumber

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
autocmd BufWritePre * %s/\s\+$//e

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

autocmd BufWritePre * %s/\s\+$//e

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

" Colorscheme - Now playing
colorscheme znake

" Approved Themes
let themes = [ "Benokai",
      \"OceanicNext",
      \"ayu",
      \"blink-contrast",
      \"bold",
      \"candyman",
      \"crayon",
      \"cthulhian",
      \"darker-robin",
      \"darkocean",
      \"ekvoli",
      \"elda",
      \"eva01",
      \"frozen",
      \"gotham",
      \"iceberg-contrast",
      \"hawaii",
      \"hub-contrast",
      \"hybrid",
      \"hydrangea",
      \"jellybeans",
      \"jhdark",
      \"loyal-contrast",
      \"minimalist",
      \"neodark",
      \"newton",
      \"one",
      \"overflow",
      \"pencil",
      \"petrel",
      \"pleasure-contrast",
      \"revelation",
      \"seti",
      \"shades-of-teal",
      \"sonofobsidian",
      \"southwest-fog",
      \"spacegray",
      \"tesla",
      \"tropikos",
      \"turtles",
      \"twilight",
      \"ubaryd",
      \"underwater",
      \"underwater-mod",
      \"vanzan_color",
      \"vividchalk",
      \"vj",
      \"watermark",
      \"whitebox",
      \"znake" ]

function! ChangeTheme()
  echom index(g:themes, g:colors_name).g:colors_name
  if g:colors_name || g:colors_name ==# g:themes[-1]
    execute 'colorscheme '.g:themes[0]
  else
    let s:n = index(g:themes, g:colors_name) + 1
    execute 'colorscheme '.g:themes[s:n]
  endif
endfunction
nnoremap <leader>cn :call ChangeTheme()<cr>


" Colorscheme extras
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:nord_italic = 1
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 12


""""""""""""""""""""""""""""""""""""""""
"   => Mappings
""""""""""""""""""""""""""""""""""""""""

"" Vim file manager
" Open vimrc in split
noremap <leader>ev :vsplit $MYVIMRC<cr>
" Source vimrc
noremap <leader>sv :source $MYVIMRC<cr>

" SEARCH!
nnoremap <leader>/ :%s/\V/gc<Left><Left><Left>

function! SearchWord()
  let word = expand("<cword>")
  echo word
  execute Rg<space>word
endfunction

" FZF/Rg search
nnoremap <leader>a :Rg<space><CR>
nnoremap <leader>f :Files<CR>
" nnoremap <leader>w :call SearchWord()<CR>
nnoremap <leader>bu :Buffers<CR>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --smart-case --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" Don't use arrows
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" ESC from insert mode with jk
inoremap jk <esc>
" Don't allow <esc> in insert mode
inoremap <esc> <nop>

" delete line
inoremap <c-d> <esc>ddi

" change colorscheme
nnoremap <leader>c :Colors<cr>

"" Casing
" uppercase
nnoremap <space>u gUiw
" lowercase
nnoremap <space>l guiw
" capitalize
nnoremap <space>i guiw~h

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
nnoremap <leader><leader>s :update!<cr>
inoremap <leader><leader>s <esc>:update!<cr>

" execute macro
nnoremap Q @q<cr>

" Save and quit with zz
nnoremap zz ZZ
nnoremap <leader>q :q<cr>

" Go to last buffer
nnoremap <leader>bb :b#<cr>
nnoremap <leader>bn :bn<cr>
nnoremap <leader>bp :bp<cr>
nnoremap gb :ls<cr>:buffer<space>

" Go to windows with hjkl
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k


" Treat long lines as break lines (useful when moving around in them)
nnoremap j gj
nnoremap k gk

" Create a newline from where the cursor is
nnoremap <leader>j i<CR><ESC>

nnoremap <space>o o<ESC>
nnoremap <space>O O<ESC>

" Smart way to move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Switch CWD to the directory of the open buffer
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>
" open current director of current file in vertical split
nnoremap <leader>vs :vs %:h<cr>
nnoremap <leader>fs <C-w>f

" Copy paragraph
noremap cp yap<S-}>p

" Snippet like mappings
" Describe block
nnoremap <leader>des odescribe(''<ESC>mma, () => {<CR><CR>})<ESC>`mi

" It block
nnoremap <leader>it oit(''<ESC>mma, () => {<CR><CR>})<ESC>`mi


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

" Email addresses
iabbrev bg@ billy.montgomery@gmail.com
iabbrev bh@ billy.montgomery@hixme.com


""""""""""""""""""""""""""""""""""""""""
"   => Scripts
""""""""""""""""""""""""""""""""""""""""

" Javascript
" Easy console log
function! EasyConsoleLog()
  let word = expand("<cword>")
  execute "normal! oconsole.log('".word." = ', ".word.")"
endfunction

nnoremap <leader>log :call EasyConsoleLog()<CR>


" Delete trailing white space on save
"func! DeleteTrailingWS()
"  exe "normal mz"
"  %s/\s\+$//ge
"  exe "normal `z"
"endfunc


" Rebuild tests
let s:counter = 0
function! MyCounter()
  let s:counter = s:counter + 1
  echo s:counter
endfunction
command! Tick call MyCounter()

function! RemoveFile()
  echo 'buf -' .bufname('#:p')
  let result = confirm("Are you sure?", "&Yes\n&No\n")
  if (result ==# 1)
    echom "Deleting " . bufname("%") . "..."
    let theFile = expand('%:p')
    let dit = delete(theFile)
    if (dit)
      echo "Deleted " . theFile
    else
      echohl "Failed to delete " . theFile
    endif

    execute "e#"
    return 1
  endif
  return 2
endfunction
command! RFile call RemoveFile()


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
  autocmd FileType javascript set formatprg=prettier\ --stdin
  autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

  " Import modules for javascript
  autocmd Filetype javascript :iabbrev im import<space><space>from<space><left><left><left><left><left><left><left>

  " Export modules and functions for javascript
  autocmd Filetype javascript :iabbrev exc export const =
  autocmd Filetype javascript :iabbrev exf export function() {}
  autocmd Filetype javascript :iabbrev exd export default
  autocmd Filetype javascript nnoremap <leader>c I//<esc>
"  autocmd BufWrite *.js :call DeleteTrailingWS()
augroup END


augroup filetype_markdown
  autocmd!

  autocmd Filetype *.md :inoremap link +<space>[]()<esc><left>p<left>
augroup END

" Python
"augroup filetype_python
"  autocmd!
"  autocmd BufWrite *.py :call DeleteTrailingWS()
"augroup END



""""""""""""""""""""""""""""""""""""""""
"   => Status Line
""""""""""""""""""""""""""""""""""""""""
set statusline=%f
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L


"""""""""""""""""""""""""""""""""""""""""
:finish

Vim built the hard way

