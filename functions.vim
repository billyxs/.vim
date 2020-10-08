""""""""""""""""""""""""""""""""""""""""""""""
" Logging
""""""""""""""""""""""""""""""""""""""""""""""
" Log
function! LogIt(command, isVisual)
  if (a:isVisual)
    " Get register g
    let expression = @g
    let message = ""
  else 
    let expression = expand("<cword>")
    let message = expression
  endif
  
  execute "normal! o".a:command."('".message." = ', ".expression.")"

  if (a:isVisual)
    execute "normal! ^f'"
  endif
endfunction

function! JavascriptConsoleLog(isVisual)
  call LogIt('console.log', a:isVisual)
endfunction

function! PythonPrint(isVisual)
  call LogIt('print', a:isVisual)
endfunction


function! MarkDownLink()
  execute "normal! o- [](".@*.")\<esc>T["
endfunction


""""""""""""""""""""""""""""""""""""""""""""""
" File management
""""""""""""""""""""""""""""""""""""""""""""""

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

""""""""""""""""""""""""""""""""""""""""""""""
" Code management
""""""""""""""""""""""""""""""""""""""""""""""
" toggleLint
function! Lintjs() 
  let g:ale_fixers = { 'javascript': [ 'eslint' ] }
  echo "eslint"
endfunction

function! Lintjsp() 
  let g:ale_fixers = { 'javascript': [ 'prettier', 'eslint' ] }
  echo "eslint with prettier"
endfunction

function! Lintts() 
  let g:ale_fixers = { 'javascript': [ 'prettier', 'tslint' ] }
  echo "tslint with prettier"
endfunction


""""""""""""""""""""""""""""""""""""""""""""""
" Date/Time
""""""""""""""""""""""""""""""""""""""""""""""

" Today's date
function! Date()
  let date = strftime("%Y-%m-%d")
  echo "Today's date: ".date
  execute "normal! i".date
endfunction

" Current time
function! CurrentTime()
  let time = strftime("%H:%M")
  echo "Today's time: ".time
  execute "normal! i".time
endfunction

""""""""""""""""""""""""""""""""""""""""""""""
" Process/Habit management
""""""""""""""""""""""""""""""""""""""""""""""
" Calcluate work syntax 
function! CalculateWorkTime()
  " Get visual selection
  let expression = @g
  let rows = split(expression, '\n')

  let l:start_hours = 0 
  let l:start_mins = 0
  let l:total_time = 0

  for line in rows
    let items = split(line, ':')
    if items[0] =~ "start"
      let l:start_hours = str2nr(Strip(items[1]))
      let l:start_mins = str2nr(Strip(items[2]))
    else
      let hours = (str2nr(Strip(items[1]))-l:start_hours)*60
      let end_minutes = str2nr(Strip(items[2]))
      let l:total_time = l:total_time+hours+end_minutes-l:start_mins
    endif
  endfor

  let total_hours = l:total_time/60
  let total_minutes = l:total_time%60

  let result = total_hours."h ".total_minutes."m"

  execute "normal! OTotal: ".result
endfunction

function! DayHeader()
  let header = strftime("# %Y-%m-%d - %A")
  execute "normal! i".header
endfunction


""""""""""""""""""""""""""""""""""""""""""""""
" Utilities
""""""""""""""""""""""""""""""""""""""""""""""
function! Strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

" Copy current buffer path to multiple buffers
" Author - Calvin Cieslak 
function! CopyPath()
  execute "let @+=expand('%:p')"
endfunction

" Copy current buffer path directory to multiple buffers
" Author - Calvin Cieslak
function! CopyPathDir()
  execute "let @+=expand('%:p:h')"
endfunction

" Spell check
" https://dev.to/coreyja/vim-spelling-suggestions-with-fzf-1ccc
function! FzfSpellSing(word)
  exe 'normal! "_ciw'.a:word
endfunction
function! FzfSpell()
  let suggestions = spellsuggest(expand("<cword>"))
  return fzf#run({'source': suggestions, 'sink': function("FzfSpellSink"), 'down': 10})
endfunction
