function! CustomGoFmt()
  let file = expand('%')
  silent execute "!gofmt -w " . file
  edit!
  set filetype = go
endfunction

command! CustomGoFmt call CustomGoFmt()
augroup go_autocmd
  autocmd BufWritePost *.go CustomGoFmt
augroup END
