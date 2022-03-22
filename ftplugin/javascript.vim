  command! Lintjs call Lintjs()
  command! Lintjsp call Lintjsp()
  command! Lintts call Lintts()

  " autocmd FileType javascript set formatprg=prettier\ --stdin
  " autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

  " Import modules for javascript
  iabbrev im import<space><space>from<space><left><left><left><left><left><left><left>

  " Export modules and functions for javascript
  iabbrev exc export const =
  iabbrev exf export function() {}
  iabbrev exd export default
  nnoremap <leader>c I//<esc>
