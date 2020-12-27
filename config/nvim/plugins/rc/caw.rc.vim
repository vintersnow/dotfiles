" function! InitCaw() abort
"   if !&l:modifiable
"     silent! nunmap <buffer> <C-_>
"     silent! xunmap <buffer> <C-_>
"   else
"     nmap <buffer> <C-_> <Plug>(caw:hatpos:toggle)
"     xmap <buffer> <C-_> <Plug>(caw:hatpos:toggle)
"   endif
" endfunction
" autocmd MyAutoCmd FileType * call InitCaw()
