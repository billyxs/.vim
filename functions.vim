" Easy console log
function! EasyConsoleLog()
  let word = expand("<cword>")
  execute "normal! oconsole.log('".word." = ', ".word.")"
endfunction

function! PythonLog()
  let word = expand("<cword>")
  execute "normal! oprint('".word." = ', ".word.")"
endfunction

" Copy current buffer path to multiple buffers
" Author - Calvin Cieslak 
function! CopyPath() 
  execute "let @*=expand('%:p')"
  execute "let @+=expand('%:p')"
endfunction

" Copy current buffer path directory to multiple buffers
" Author - Calvin Cieslak 
function! CopyPathDir() 
  execute "let @*=expand('%:p:h')"
  execute "let @+=expand('%:p:h')"
endfunction

function! MarkDownLink()
  execute "normal! o- [](".@*.")\<esc>T["
endfunction

" Delete trailing white space on save
"function! DeleteTrailingWS()
"  exe "normal mz"
"  %s/\s\+$//ge
"  exe "normal `z"
"endfunction

" Remove File
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

