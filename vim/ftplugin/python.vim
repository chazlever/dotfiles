setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal textwidth=79
setlocal smarttab
setlocal expandtab

" Toggle the Pyflakes plugin
if has('python')
   let g:pyflakes_autostart = 0
   map <silent> <Leader>d <Esc>:PyflakesToggle<CR>
endif
