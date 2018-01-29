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
Plug 'scrooloose/nerdcommenter'
Plug 'JamshedVesuna/vim-markdown-preview'

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
Plug 'othree/yajs.vim'
Plug 'othree/es.next.syntax.vim'

" Themes
Plug 'rainglow/vim'
"Plug 'flazz/vim-colorschemes'
Plug 'seesleestak/oceanic-next'
Plug 'rakr/vim-one' " colorscheme one
Plug 'beigebrucewayne/Turtles'
Plug 'ayu-theme/ayu-vim'
Plug 'KeitaNakamura/neodark.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'lifepillar/vim-solarized8'
Plug 'nightsense/seabird'
Plug 'dunckr/vim-monokai-soda'
Plug 'morhetz/gruvbox'
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
inoremap <c-g><c-u> <esc>guiw
" lowercase 
inoremap <c-g><c-l> <esc>guiw
" capitalize 
inoremap <c-g><c-i> <esc>guiw~h


" Surround word with quotes 
nnoremap <leader>"w viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>'w viw<esc>a'<esc>bi'<esc>lel

" Motions
nnoremap H 0
noremap L $


""""""""""""""""""""""""""""""""""""""""
"   => Abbreviations 
""""""""""""""""""""""""""""""""""""""""

" Email addresses  
iabbrev bg@ billy.montgomery@gmail.com
iabbrev bh@ billy.montgomery@hixme.com


""""""""""""""""""""""""""""""""""""""""
"   => Buffers 
""""""""""""""""""""""""""""""""""""""""
" Javascript commands
filetype on
augroup filetype_javascript
  autocmd!
  " Import modules for javascript
  autocmd Filetype javascript :iabbrev im import

  " Export modules and functions for javascript
  autocmd Filetype javascript :iabbrev exc export const =
  autocmd Filetype javascript :iabbrev exf export function() {}
  autocmd Filetype javascript :iabbrev exd export default
  autocmd Filetype javascript nnoremap <leader>c I//<esc> 
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

