"""""""""""""""""""""""""""""""""""""""""""""""
" neosnippet

" Plugin key-mappings.
imap <C-K>     <Plug>(neosnippet_expand_or_jump)
smap <C-K>     <Plug>(neosnippet_expand_or_jump)
xmap <C-K>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" imap <expr><TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ neosnippet#expandable_or_jumpable() ?
"  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


let g:neosnippet#snippets_directory=expand('~/.config/nvim/snippets')
