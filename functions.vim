""""""""""""""""""""""""""""""""""""""""""""""
" Logging by filetype
""""""""""""""""""""""""""""""""""""""""""""""

function! LogIt(isVisual) abort
  " Get the current filetype we are in
  let l:filetype = &filetype

  let l:message = ""

  " Is this a visual selection or not?
  if (a:isVisual)
    " Get register z
    let l:expression = @z
    let l:message = ""
  else 
    " get current word under cursor
    " this is typically a variable we want to log
    let l:expression = expand("<cword>")
    let l:message = expression
  endif
  
  if l:filetype == 'vim'
    " output - echo expression
    execute "normal! oecho ".l:message
  elseif l:filetype == 'sh'
    " output - echo expression
    execute "normal! oecho $".l:message
  elseif l:filetype == 'python'
    " output - print('variable = ', variable)
    execute "normal! oprint('".l:message." = ', ".l:expression.")"
  elseif l:filetype == 'javascript'
    " output - console.log('variable = ', variable)
    execute "normal! oconsole.log('".l:message." = ', ".l:expression.")"
  else
    " If the file is not supported, give the message
    echo "LogIt not setup for filetype: ".l:filetype
  endif

  " If this is a visual selection scenario
  " Go to beginning of log line and find first single quote
  if (a:isVisual)
    execute "normal! ^f'"
  endif
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


" Argument/Dictionary formatters

function! InlineArguments()
  " Copy the args list to 'z' register
  execute 'normal! vi("zy'

  " Create list splitting by newline
  let lines = split(@z, '\n')

  " Create a new arg list for output
  let l:arg_list = map(range(len(lines)), 0)

  " Track the index
  let l:index = 0

  for line in lines
    " Trim white space and add to output arg list
    let arg = Trim(line)
    let arg = substitute(Trim(arg), ',', '', '')
    if len(arg) < 1
      continue
    endif
    echo arg

    let l:arg_list[l:index] = arg
    let l:index = l:index + 1
  endfor

  " Deleate the argument list and build an inline one
  " by joining the new arg list
  execute 'normal! va(di('.join(l:arg_list, ', ').')'
endfunction


function! LinedArguments()
  " Copy the args list to 'z' register
  execute 'normal! vi("zy'

  " Create list of args splitting on comma
  let l:arg_list = split(@z, ',')

  let l:output = ""
  for arg in l:arg_list
    let arg = substitute(Trim(arg), ',', '', '')
    if len(arg) < 1
      continue
    endif

    let l:output .= "\t".arg.",\n"
  endfor

  let l:output = "(\n".l:output.")"
  execute "normal! va(di".output
endfunction


function! InlineKeyValues()
  " Copy the args list to 'z' register
  execute 'normal! vi{"zy'

  " Create list splitting by newline
  let lines = split(@z, '\n')

  " Create a new arg list for output
  let l:arg_list = map(range(len(lines)), 0)

  " Track the index
  let l:index = 0

  for line in lines
    " Trim white space and add to output arg list
    let arg = Trim(line)
    let arg = substitute(Trim(arg), ',', '', '')
    if len(arg) < 1
      continue
    endif

    let l:arg_list[l:index] = arg
    let l:index = l:index + 1
  endfor

  " Deleate the argument list and build an inline one
  " by joining the new arg list
  execute 'normal! va{di { '.join(l:arg_list, ', ').' }'
endfunction


function! LinedKeyValues()
  " Copy the args list to 'z' register
  execute 'normal! vi{"zy'

  " Create list of args splitting on comma
  let l:arg_list = split(@z, ',')

  let l:output = ""
  for arg in l:arg_list
    let arg = substitute(Trim(arg), ',', '', '')
    if len(arg) < 1
      continue
    endif

    let l:output .= "\t".arg.",\n"
  endfor

  let l:output = "{\n".l:output."}"
  execute "normal! va{di ".output
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
function! Time()
  let time = strftime("%H:%M")
  echo "Today's time: ".time
  execute "normal! i".time
endfunction


""""""""""""""""""""""""""""""""""""""""""""""
" Process/Habit management
""""""""""""""""""""""""""""""""""""""""""""""

" Add link syntax for url in clipboard
function! MarkDownLink()
  execute "normal! o- [](".@*.")\<esc>T["
endfunction
,

" Calculate week work time
function! CalculateWeekWorkTime()
  execute 'normal! mmggVG"gy`m'
  let all_text = @g
  let lines = split(all_text, '\n')

  let l:minutes = 0
  for line in lines
    if line =~ "Total"
      let time = split(line, ' ')
      let add_minutes = str2nr(Trim(time[1]))*60
      let l:minutes += add_minutes + str2nr(time[2])
    endif
  endfor

  let total_hours = l:minutes/60
  let total_minutes = l:minutes%60

  let result = total_hours."h ".total_minutes."m"

  execute "normal! 2GO\nWeek Total: ".result."\n"
endfunction

" Calcluate work time syntax 
function! CalculateWorkTime()
  " Get visual selection
  let expression = @g
  let rows = split(expression, '\n')

  let l:start_hours = 0 
  let l:start_mins = 0
  let l:total_time = 0
  let error = 0

  for line in rows
    let items = split(line, ':')
    if len(items) < 3
      let error = 1
      break
    else
      if items[0] =~ "start"
        let l:start_hours = str2nr(Trim(items[1]))
        let l:start_mins = str2nr(Trim(items[2]))
      elseif items[0] =~ "end"
        let hours = (str2nr(Trim(items[1]))-l:start_hours)*60
        let end_minutes = str2nr(Trim(items[2]))
        let l:total_time += hours+end_minutes-l:start_mins
      endif
    endif
  endfor

  if error == 1
    echo "Time not formatted correctly"
  else
    let total_hours = l:total_time/60
    let total_minutes = l:total_time%60

    let result = total_hours."h ".total_minutes."m"

    execute "normal! OTotal: ".result."\n"
  endif
endfunction

function! DayHeader()
  let header = strftime("# %Y-%m-%d - %A")
  execute "normal! i".header
endfunction


""""""""""""""""""""""""""""""""""""""""""""""
" Vim script utilities
""""""""""""""""""""""""""""""""""""""""""""""

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

" Support trimming for older versions of Vim
function! Trim(word) abort
  return substitute(a:word, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction
