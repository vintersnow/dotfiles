"---------------------------------------------------------------------------
" quickrun.vim
"
let g:quickrun_config = {
\   "_" : {
\       "runner" : "vimproc",
\       "runner/vimproc/updatetime" : 40,
\   }
\}
nmap <silent> <Leader>r <Plug>(quickrun)
