nnoremap <silent><expr> <Leader>r  :MagmaEvaluateOperator<CR>
nnoremap <silent>       <Leader>rr :MagmaEvaluateLine<CR>
xnoremap <silent>       <Leader>r  :<C-u>MagmaEvaluateVisual<CR>
nnoremap <silent>       <Leader>rc :MagmaReevaluateCell<CR>
nnoremap <silent>       <Leader>rd :MagmaDelete<CR>
nnoremap <silent>       <Leader>ro :MagmaShowOutput<CR>

" let g:magma_automatically_open_output = v:false
" let g:magma_image_provider = "ueberzug"
