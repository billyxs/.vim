"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" a vimrc experience - by billyxs
"
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
" Sections:
"   => General 
"   => Mappings
"
""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""

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

"" Insert mode 
" delete line
inoremap <c-d> <esc>ddi

" uppercase
inoremap <c-g><c-U> <esc>gUiwi
" lowercase 
inoremap <c-g><c-l> <esc>guiwi
" capitalize 
inoremap <c-g><c-i> <esc>guiw~hi

:finish

"""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""
Vim built the hard way
