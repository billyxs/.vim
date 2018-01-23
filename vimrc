"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" a vimrc experience - by billyxs
"
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" Sections:
"   => Leaders 
"   => General 
"   => Mappings
"   => Abbreviations 
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
inoremap <c-g><c-U> <esc>gUiwi
" lowercase 
inoremap <c-g><c-l> <esc>guiwi
" capitalize 
inoremap <c-g><c-i> <esc>guiw~hi


" Surround word with quotes 
nnoremap <leader>"w viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>'w viw<esc>a'<esc>bi'<esc>lel

" Motions
vnoremap <leader>" `<i"<esc>gv`>i"<esc>
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


"""""""""""""""""""""""""""""""""""""""""
:finish

Vim built the hard way

