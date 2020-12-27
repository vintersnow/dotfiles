"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic

" エラー行に sign を表示
let g:syntastic_enable_signs = 1
" location list を常に更新
let g:syntastic_always_populate_loc_list = 0
" location list を常に表示
let g:syntastic_auto_loc_list = 0
" ファイルを開いた時にチェックを実行しない
let g:syntastic_check_on_open = 0
" 保存時実行
let g:syntastic_check_on_save=1
" :wq で終了する時もチェックする
let g:syntastic_check_on_wq = 0

" js
let g:syntastic_javascript_checkers=['eslint']

