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
    let l:message = "s "
  else
    " get current word under cursor
    " this is typically a variable we want to log
    let l:expression = expand("<cword>")
    let l:message = expression
  endif

  if l:filetype == 'vim'
    " output - echo expression
    execute "normal! oecho ".l:expression
  elseif l:filetype == 'sh'
    " output - echo expression
    execute "normal! oecho $".l:expression
  elseif l:filetype == 'python'
    " output - print('variable = ', variable)
    execute "normal! oprint('".l:message." = ', ".l:expression.")"
  elseif l:filetype == 'javascript' || l:filetype == 'typescript'
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

" For in syntax builder
function! ForInList(visualSelection)
  " Get the current filetype we are in
  let l:filetype = &filetype

  let l:list = "items"
  let l:item = "item"

  " Is this a visual selection or not?
  if (a:visualSelection)
    " Get register z
    let l:list = Trim(GetVisualSelection())
  else
    " Get word under cursor for iterating over
    let l:word = Trim(expand("<cword>"))

    " If word is provided, use it
    if len(l:word) > 0
      let l:list = l:word
    endif
  endif

  if l:list[-1:] == "s"
    let l:item = l:list[0:-2]
  endif

  if l:filetype == 'python'
    " output - print('variable = ', variable)
    execute "normal! ofor ".l:item." in ".l:list.":"
  else
    " If the file is not supported, give the message
    echo "ForList not setup for filetype: ".l:filetype
  endif

  " Go to item of iteration syntax
  execute "normal! ^f l"
endfunction


" For in syntax builder
function! ForInKeyValue(visualSelection) abort
  " Get the current filetype we are in
  let l:filetype = &filetype

  let l:list = "items"

  " Is this a visual selection or not?
  if (a:visualSelection)
    " Get register z
    let l:list = Trim(GetVisualSelection())
  else
    " get current word under cursor
    " this is typically a variable we want to log
    let l:list = Trim(expand("<cword>"))
  endif

  if l:filetype == 'python'
    " output - print('variable = ', variable)
    execute "normal! ofor key, value in ".l:list.".items():"
  else
    " If the file is not supported, give the message
    echo "ForInKeyValue not setup for filetype: ".l:filetype
  endif

  " Go to item of iteration syntax
  execute "normal! o\t"
endfunction


" Import module
function! Import() abort
  " Create a mark at z
  execute "normal! mz"

  " Get the current filetype we are in
  let l:filetype = &filetype

  " Prompt from import questions
  let l:import_item = input("Import what? ")
  let l:import_package = input("From package? ")

  if l:filetype == 'python'
    if Trim(l:import_package) == ""
      execute "normal! ggOimport ".l:import_item
    else
      execute "normal! ggOfrom ".l:import_package." import ".l:import_item
    endif
  elseif l:filetype == 'javascript'
    execute "normal! ggOimport { ".l:import_item." } from ".l:import_package
  else
    " If the file is not supported, give the message
    echo "Import not setup for filetype: ".l:filetype
  endif

  " Go go back to mark
  execute "normal! 'z"
endfunction

" Dictionary builder
function! Dict()
  " Get the current filetype we are in
  let l:filetype = &filetype

  if l:filetype == 'python'
    execute "normal! idict("
    let l:exit = ""

    let key = input("Key: ")
    while key != "q"
      let value = input("Value: ")
      execute "normal! o".key."=".value.","
      let key = input("Key: ")
    endwhile

    execute "normal! o)"
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
  " Create a visual selction of the arguments in braces
  execute 'normal! vi('

  " Create list splitting the selction by newline
  let lines = split(GetVisualSelection(), '\n')

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

" Calculate time for prefixed lines with time formatting. eg: 8h 10m
function! GetMinutesForLinesWithPrefix(lines, prefix, separator) abort
  let l:minutes = 0
  for line in a:lines
    if line =~ a:prefix
      let time = split(line, a:separator)
      # calculate minutes from hours
      let add_minutes = str2nr(Trim(time[1]))*60
      # add minutes and hours
      let l:minutes += add_minutes + str2nr(Trim(time[2]))
    endif
  endfor

  return l:minutes
endfunction


" Calculate week work time
" Time formatting must follow example: 8h 10m
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

  execute "normal! 2GO\nWeek Total: ".result
endfunction


" Calculate time off for sick/pto
function! CalculateTimeOff(type)
  execute 'normal! mmggVG"gy`m'
  let all_text = @g
  let lines = split(all_text, '\n')

  let l:time_off = 0
  for line in lines
    if line =~ "ooo:"
      let items = split(line, ' ')
      let value = Trim(items[1])
      if value == a:type
        let l:time_off += 8*60
      endif
    endif
  endfor

  return l:time_off
endfunction


function! CalculateWeekTimeOff()
  execute 'normal! mmggVG"gy`m'
  let all_text = @g
  let lines = split(all_text, '\n')

  let l:sick_time = CalculateTimeOff("sick")
  let l:pto_time = CalculateTimeOff("pto")
  let l:holiday_time = CalculateTimeOff("holiday")
  let l:output = ""

  if l:sick_time > 0
    let sick_hours = l:sick_time/60
    let sick_minutes = l:sick_time%60
    let l:output = l:output."\nSick: ".sick_hours."h ".sick_minutes."m"
  endif

  if l:pto_time > 0
    let pto_hours = l:pto_time/60
    let pto_minutes = l:pto_time%60
    let l:output = l:output."\nPTO: ".pto_hours."h ".pto_minutes."m"
  endif

  if l:holiday_time > 0
    let holiday_hours = l:holiday_time/60
    let holiday_minutes = l:holiday_time%60
    let l:output = l:output."\nHoliday: ".holiday_hours."h ".holiday_minutes."m"
  endif

  if len(l:output) > 0
    execute "normal! 2GO\nWeek Time Off".l:output
  else
    echo "No time off"
  endif
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

" Output week time summary
function! CalculateWeekSummary()
  call CalculateWeekTimeOff()
  call CalculateWeekWorkTime()
endfunction

""""""""""""""""""""""""""""""""""""""""""""""
" Vim script utilities
""""""""""""""""""""""""""""""""""""""""""""""

" Copy current buffer path to multiple buffers
" Author: Calvin Cieslak
function! CopyPath()
  execute "let @+=expand('%:p')"
endfunction

" Copy current buffer path directory to multiple buffers
" Author: Calvin Cieslak
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

" Get visual selection
" Author: xolox - https://stackoverflow.com/a/6271254
function! GetVisualSelection()
  let [line_start, column_start] = getpos("'<")[1:2]
  let [line_end, column_end] = getpos("'>")[1:2]
  let lines = getline(line_start, line_end)

  " Return nothing if no selection is available
  if len(lines) == 0
    return ''
  endif

  let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][column_start - 1:]
  let result = join(lines, "\n")

  " Modification to script to clear register after getting the value
  setreg("'<", [])
  setreg("'>", [])
  return result
endfunction
