"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" a vimrc experience - by billyxs
"
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" Sections:
"   => Leader 
"   => General 
"   => Mappings
"   => Abbreviations 
"
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""
"   => Leader 
""""""""""""""""""""""""""""""""""""""""
" With a map leader it's possible to do extra key combinations!
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"


""""""""""""""""""""""""""""""""""""""""
"   => General 
""""""""""""""""""""""""""""""""""""""""

" Line numbers
set number
set relativenumber
set numberwidth=3
set shiftwidth=2


""""""""""""""""""""""""""""""""""""""""
"   => Mappings
""""""""""""""""""""""""""""""""""""""""

" Open vimrc in split
noremap <leader>ev :vsplit $MYVIMRC<cr> 
" Source vimrc
noremap <leader>sv :source $MYVIMRC<cr> 

"" Insert mode 
" delete line
inoremap <c-d> <esc>ddi

" uppercase
inoremap <c-g><c-U> <esc>gUiwi
" lowercase 
inoremap <c-g><c-l> <esc>guiwi
" capitalize 
inoremap <c-g><c-i> <esc>guiw~hi


""""""""""""""""""""""""""""""""""""""""
"   => Abbreviations 
""""""""""""""""""""""""""""""""""""""""

" Email addresses  
:iabbrev bg@ billy.montgomery@gmail.com
:iabbrev bh@ billy.montgomery@hixme.com

" Import modules for javascript
:iabbrev imp import 

" Export modules and functions for javascript
:iabbrev expc export const =
:iabbrev expf export function() {}
:iabbrev expd export default
""""""""""""""""""""""""""""""""""""""""

:finish

"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
Vim built the hard way
