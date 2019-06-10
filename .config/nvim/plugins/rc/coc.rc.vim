
nnoremap <silent> <C-K>h :call CocAction('doHover')<CR>
nnoremap <silent> <C-K>d :call CocAction('jumpReferences')<CR>
" nnoremap <silent> <C-K>s :call LanguageClient#textDocument_signatureHelp()<CR>
nnoremap <silent> <C-K>r :call CocAction('rename')<CR>
" nnoremap <silent> <F3> :call LanguageClient_textDocument_formatting()<CR>

" Denite
nnoremap <silent> <C-K>l :Denite coc-symbols<CR>
" nnoremap <silent> <C-K>d :Denite references<CR>

" use <tab> for trigger completion and navigate next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

augroup coc_func
  autocmd!
  autocmd CursorHoldI,CursorMovedI * call CocAction('showSignatureHelp')
  " autocmd User CocNvimInit call s:CocAction('', 'tsserver.watchBuild')
augroup END
