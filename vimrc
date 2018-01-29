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
"   => Colors and Fonts
"   => Mappings
"   => Abbreviations 
"   => Buffers 
"   => Status Line 
"   => Scripts
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
" Time tracking
Plug 'wakatime/vim-wakatime'

" File system
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

" Text, Editing
" Plug 'scrooloose/nerdcommenter'
" Plug 'JamshedVesuna/vim-markdown-preview'

" GIT,
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Linting
Plug 'w0rp/ale'

" Search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"" Syntax
"Plug 'mxw/vim-jsx'
"Plug 'othree/yajs.vim'
"Plug 'othree/es.next.syntax.vim'

" Themes
Plug 'beigebrucewayne/Turtles'
Plug 'KeitaNakamura/neodark.vim'
Plug 'ajh17/Spacegray.vim'
"Plug 'rainglow/vim'
"Plug 'flazz/vim-colorschemes'
"Plug 'seesleestak/oceanic-next'
"Plug 'rakr/vim-one' " colorscheme one
"Plug 'ayu-theme/ayu-vim'
"Plug 'lifepillar/vim-solarized8'
"Plug 'nightsense/seabird'
"Plug 'dunckr/vim-monokai-soda'
"Plug 'morhetz/gruvbox'
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


""""""""""""""""""""""""""""""""""""""""
"   => General 
""""""""""""""""""""""""""""""""""""""""

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

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" autocmd BufNewFile,BufRead *.json set ft=javascript
" autocmd BufNewFile,BufRead *.js set ft=javascript
autocmd BufNewFile,BufReadPost *.md set filetype=mkd

" Colorscheme - Now playing
colorscheme hydrangea

" Approved Themes
"colorscheme hydrangea
"colorscheme spacegray
"colorscheme one " one-dark
"colorscheme juicy
"colorscheme bold
"colorscheme turtles
"colorscheme vividchalk
"colorscheme neodark
"colorscheme petrel
"colorscheme ayu
"colorscheme solarized8_dark_flat
"colorscheme gruvbox
"colorscheme carbonized-dark
"colorscheme OceanicNext

" Colorscheme extras
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1


""""""""""""""""""""""""""""""""""""""""
"   => Mappings
""""""""""""""""""""""""""""""""""""""""

"" Vim file manager
" Open vimrc in split
noremap <leader>ev :vsplit $MYVIMRC<cr> 
" Source vimrc
noremap <leader>sv :source $MYVIMRC<cr> 

" ESC from insert mode with jk
inoremap jk <esc>
" Don't allow <esc> in insert mode
inoremap <esc> <nop>

" delete line
inoremap <c-d> <esc>ddi


"" Casing
" uppercase
nnoremap <space>u gUiw
" lowercase 
nnoremap <space>l guiw
" capitalize 
nnoremap <space>i guiw~h

" Surround word with quotes 
nnoremap <leader>"w viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>'w viw<esc>a'<esc>bi'<esc>lel

" Motions
nnoremap H 0
noremap L $

" Save and quit with zz
nnoremap zz ZZ

""""""""""""""""""""""""""""""""""""""""
"   => Abbreviations 
""""""""""""""""""""""""""""""""""""""""

" Email addresses  
iabbrev bg@ billy.montgomery@gmail.com
iabbrev bh@ billy.montgomery@hixme.com


""""""""""""""""""""""""""""""""""""""""
"   => Buffers 
""""""""""""""""""""""""""""""""""""""""
filetype on

" Javascript
augroup filetype_javascript
  autocmd!
  " Import modules for javascript
  autocmd Filetype javascript :iabbrev im import

  " Export modules and functions for javascript
  autocmd Filetype javascript :iabbrev exc export const =
  autocmd Filetype javascript :iabbrev exf export function() {}
  autocmd Filetype javascript :iabbrev exd export default
  autocmd Filetype javascript nnoremap <leader>c I//<esc> 
  autocmd BufWrite *.js :call DeleteTrailingWS()
augroup END

" Python 
augroup filetype_python
  autocmd!
  autocmd BufWrite *.py :call DeleteTrailingWS()
augroup END



""""""""""""""""""""""""""""""""""""""""
"   => Status Line 
""""""""""""""""""""""""""""""""""""""""
set statusline=%f
set statusline+=%=
set statusline+=%l
set statusline+=/
set statusline+=%L



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
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc


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
  echo result
  if (result ==# 1)
    echom "Deleting " . bufname("%") . "..."
    let theFile=expand('%:p')
    echo theFile
    let dit = delete(theFile)
    if (dit)
      echo "Deleted " . theFile
    else
      echohl "Failed to delete " . theFile
    endif 

    echo "it -- " . dit
    echo "deleted" 
    execute "bd!"
    echo "bd it" 
    execute "e#"
    echo "b! # it" 
    return 1
  endif
  return 2
endfunction
command! RFile call RemoveFile()



"""""""""""""""""""""""""""""""""""""""""
:finish

Vim built the hard way

